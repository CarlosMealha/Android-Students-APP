import 'package:firstapp/Data/Horario.dart';
import 'package:flutter/material.dart';
import "package:firstapp/UI/EscolherCadeira.dart";
import "package:firstapp/Data/Horario.dart";

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
      items: getHorario().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
