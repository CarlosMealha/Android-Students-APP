import 'package:firstapp/Data/Cadeiras.dart';
import 'package:flutter/material.dart';
import "package:firstapp/UI/EscolherCadeira.dart";
import "package:firstapp/Data/Cadeiras.dart";

class EscolherCadeiraWidget extends StatefulWidget {
  const EscolherCadeiraWidget({Key? key}) : super(key: key);

  @override
  State<EscolherCadeiraWidget> createState() => _EscolherCadeiraWidgetState();
}

class _EscolherCadeiraWidgetState extends State<EscolherCadeiraWidget> {
  String dropdownValue = 'ES';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: getCadeiras().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
