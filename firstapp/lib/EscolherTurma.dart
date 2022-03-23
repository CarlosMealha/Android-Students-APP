import 'package:flutter/material.dart';

class EscolherTurmaWidget extends StatefulWidget {
  const EscolherTurmaWidget({Key? key}) : super(key: key);

  @override
  State<EscolherTurmaWidget> createState() => _EscolherTurmaWidgetState();
}

class _EscolherTurmaWidgetState extends State<EscolherTurmaWidget> {
  String dropdownValue = '02LEIC01';

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
      items: <String>['02LEIC01', '02LEIC02', '02LEIC03', '02LEIC04']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
