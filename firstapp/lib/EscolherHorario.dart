import 'package:flutter/material.dart';
import "package:firstapp/EscolherCadeira.dart";

class EscolherHorarioWidget extends StatefulWidget {
  const EscolherHorarioWidget({Key? key}) : super(key: key);

  @override
  State<EscolherHorarioWidget> createState() => _EscolherHorarioWidgetState();
}

class _EscolherHorarioWidgetState extends State<EscolherHorarioWidget> {
  String dropdownValue = '14:00';

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
      items: <String>['14:00', '14:30', '15:00', '15:30', '16:00']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
