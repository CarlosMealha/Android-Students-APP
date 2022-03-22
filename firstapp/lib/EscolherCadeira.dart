import 'package:flutter/material.dart';
import "package:firstapp/EscolherCadeira.dart";

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
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['ES', 'DA', 'LTW', 'LC']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
