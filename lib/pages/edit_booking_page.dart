import 'package:appbooking/db/booking.dart';
import 'package:appbooking/model/book.dart';
import 'package:flutter/material.dart';
import 'package:appbooking/widget/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Booking? bookings;

  const AddEditNotePage({
    Key? key,
    this.bookings,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool status;
  late String name;
  late String address;
  late String city;
  late String district;
  late String ward;
  late String typeProperty;
  late String furniture;
  late String bedrooms;
  late String price;
  late String reporter;
  late String createdAt;



  @override
  void initState() {
    super.initState();

    
    status = widget.bookings?.status ?? false;
    name = widget.bookings?.name ?? '';
    address = widget.bookings?.address ?? '';
    city = widget.bookings?.city ?? '';
    district = widget.bookings?.district ?? '';
    ward = widget.bookings?.ward ?? '';
    typeProperty = widget.bookings?.typeProperty ?? '';
    furniture = widget.bookings?.furniture ?? '';
    bedrooms = widget.bookings?.bedrooms ?? '';
    
    price = widget.bookings?.price ?? '';
    reporter = widget.bookings?.reporter ?? '';
    createdAt = widget.bookings?.createdAt ?? '';
      
    
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            status: status,
            name: name,
            address: address,
            city: city,
            district: district,
            ward: ward,
            typeProperty: typeProperty,
            furniture: furniture,
            bedrooms: bedrooms,
            price: price,
            reporter: reporter,
            createdAt: createdAt,
            onChangedStatus: (isImportant) =>
                setState(() => status = isImportant),
            onChangedName: (nameText) => setState(() => name = nameText),
            onChangedAddress: (text) =>
                setState(() => address = text),
            onChangedcreatedAt: (text) => setState(() => createdAt = text),
            onChangedbedrooms: (text) => setState(() => bedrooms = text),
            onChangedcity: (text) => setState(() => city = text),
            onChangedfurniture: (text) => setState(() => furniture = text),
            onChangeddistrict: (text) => setState(() => district = text),
            onChangedprice: (text) => setState(() => price = text),
            onChangedreporter: (text) => setState(() => reporter = text),
            onChangedtypeProperty: (text) => setState(() => typeProperty = text),
            onChangedward: (text) => setState(() => ward = text),

          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = name.isNotEmpty && address.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.bookings != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.bookings!.copy(
      status: status,
      name: name,
      address: address,
      city: city,
      district: district,
      ward: ward,
      typeProperty: typeProperty,
      furniture: furniture,
      bedrooms: bedrooms,
      price: price,
      reporter: reporter,
      createdAt: createdAt
    );

    await BookDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Booking(
      status: status,
      name: name,
      address: address,
      city: city,
      district: district,
      ward: ward,
      typeProperty: typeProperty,
      furniture: furniture,
      bedrooms: bedrooms,
      price: price,
      reporter: reporter,
      createdAt: createdAt
    );

    await BookDatabase.instance.create(note);
  }
}