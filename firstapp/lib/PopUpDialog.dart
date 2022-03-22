import 'package:flutter/material.dart';

import 'EscolherCadeira.dart';
import 'EscolherHorario.dart';
import 'EscolherTurma.dart';

class PopUpDialogWidgetWidget extends StatelessWidget {
  const PopUpDialogWidgetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Adicionar Nova Aula',
              style: TextStyle(color: Colors.orange)),
          content: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Escolher Cadeira",
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 0.0),
              child: EscolherCadeiraWidget(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Text(
                "Escolher Turma",
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: EscolherTurmaWidget(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Text(
                "Escolher Horário",
                style: TextStyle(color: Colors.deepPurple, fontSize: 20),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: EscolherHorarioWidget(),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    child: EscolherHorarioWidget(),
                  ),
                ])
          ]),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Icon(Icons.add),
    );
  }
}
