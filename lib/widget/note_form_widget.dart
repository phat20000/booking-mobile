import 'package:flutter/material.dart';

class NoteFormWidget extends StatelessWidget {
  

  final bool status;
  final String? name;
  final String? address;
  final String? city;
  final String? district;
  final String? ward;
  final String? typeProperty;
  final String? furniture;
  final String? bedrooms;
  final String? price;
  final String? reporter;
  final String? createdAt;
  final ValueChanged<bool> onChangedStatus;
  final ValueChanged<String> onChangedName;

  final ValueChanged<String> onChangedAddress;
  final ValueChanged<String> onChangedcity;
  final ValueChanged<String> onChangeddistrict;
  final ValueChanged<String> onChangedward;
  final ValueChanged<String> onChangedtypeProperty;
  final ValueChanged<String> onChangedfurniture;
  final ValueChanged<String> onChangedbedrooms;
  final ValueChanged<String> onChangedprice;
  final ValueChanged<String> onChangedreporter;
  final ValueChanged<String> onChangedcreatedAt;

  const NoteFormWidget({
    Key? key,

    this.status = false,
    this.name = '',
    this.address = '',
    this.city = '',
    this.district = '',
    this.ward = '',
    this.typeProperty = '',
    this.furniture = '',
    this.bedrooms = '',
    this.price = '',
    this.reporter = '',
    this.createdAt = '',

    required this.onChangedAddress,
    required this.onChangedName,
    required this.onChangedStatus,
    required this.onChangedcity,
    required this.onChangeddistrict,
    required this.onChangedward,
    required this.onChangedtypeProperty,
    required this.onChangedfurniture,
    required this.onChangedbedrooms,
    required this.onChangedreporter,
    required this.onChangedprice,
    required this.onChangedcreatedAt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Name", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildName(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Adress", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildAddress(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("City", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildCity(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("District", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildDistrict(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Ward", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildWard(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Type Property", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildType(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Funrniture", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildFur(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Bedrooms", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildBed(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Price", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildPrice(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Report", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildReport(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Create At", style: TextStyle(fontSize: 16, color: Colors.white70),),
              ),
              buildCreateAt(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The name cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildAddress() => TextFormField(
        maxLines: 1,
        initialValue: address,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        validator: (title) => title != null && title.isEmpty
            ? 'The address cannot be empty'
            : null,
        onChanged: onChangedAddress,
      );

  Widget buildCity() => TextFormField(
        maxLines: 1,
        initialValue: city,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedcity,
      );

  Widget buildDistrict() => TextFormField(
        maxLines: 1,
        initialValue: district,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangeddistrict,
      );
  Widget buildWard() => TextFormField(
        maxLines: 1,
        initialValue: ward,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedward,
      );
  Widget buildType() => TextFormField(
        maxLines: 1,
        initialValue: typeProperty,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedtypeProperty,
      );
  Widget buildFur() => TextFormField(
        maxLines: 1,
        initialValue: furniture,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedfurniture,
      );
  Widget buildBed() => TextFormField(
        maxLines: 1,
        initialValue: bedrooms,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The bedrooms cannot be empty'
            : null,
        onChanged: onChangedbedrooms,
      );
  Widget buildPrice() => TextFormField(
        maxLines: 1,
        initialValue: price,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedprice,
      );
  Widget buildReport() => TextFormField(
        maxLines: 1,
        initialValue: reporter,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedreporter,
      );
  Widget buildCreateAt() => TextFormField(
        maxLines: 1,
        initialValue: createdAt,
        style: const TextStyle(color: Colors.white60, fontSize: 18),
        
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: onChangedcreatedAt,
      );
}