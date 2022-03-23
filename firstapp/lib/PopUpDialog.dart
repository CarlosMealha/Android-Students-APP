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
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          content: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 10.0),
                  child: Text('Adicionar Nova Aula',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  child: Text(
                    "Escolher Cadeira",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 0.0),
                  child: EscolherCadeiraWidget(),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    "Escolher Turma",
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
            ),
          ),
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
