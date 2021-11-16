import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appbooking/model/book.dart';


class BookDatabase {
  static final BookDatabase instance = BookDatabase._init();
  static Database? _database;


  BookDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('book.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath,filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB );


  }

  Future _createDB(Database db, int version) async {
    const idType  = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const stringType = 'TEXT';
    await db.execute('''
    CREATE TABLE $tableBooking(
      ${BookFields.id} $idType,
      ${BookFields.status} $boolType,
      ${BookFields.name} $stringType,
      ${BookFields.address} $stringType,
      ${BookFields.city} $stringType,
      ${BookFields.district} $stringType,
      ${BookFields.ward} $stringType,
      ${BookFields.typeProperty} $stringType,
      ${BookFields.furniture} $stringType,
      ${BookFields.bedrooms} $stringType,
      ${BookFields.price} $stringType,
      ${BookFields.reporter} $stringType,
      ${BookFields.createdAt} $stringType

    )
    ''');
  }
  Future<Booking> create(Booking booking) async {
    final db = await instance.database;
    
    final id = await db.insert(tableBooking, booking.toJson());
    return booking.copy(id: id);

  }
  Future readBooking(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBooking,
      columns: BookFields.values,
      where: '${BookFields.id} = ? ',
      whereArgs: [id]
    );
    if(maps.isNotEmpty) {
      return Booking.fromJson(maps.first);

    } else {
      throw Exception("Id null");
    }
  }

  Future<List<Booking>> readAll() async {
    final db = await instance.database;
    final orderBy = '${BookFields.id} ASC';
    final sResult = await db.query(tableBooking, orderBy: orderBy);

    return sResult.map((json) => 
    Booking.fromJson(json)).toList();
  }
  Future<int> update(Booking booking) async {
    final db = await instance.database;
    return db.update(
      tableBooking, 
      booking.toJson(),
      where: '${BookFields.id} = ? ',
      whereArgs: [booking.id]
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(
      tableBooking, 
      where: '${BookFields.id} = ? ',
      whereArgs: [id]
    );
  }
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}