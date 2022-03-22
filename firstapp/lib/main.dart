import 'package:firstapp/EscolherTurma.dart';
import 'package:firstapp/PopUpDialog.dart';
import 'package:flutter/material.dart';

import 'EscolherCadeira.dart';
import "EscolherTurma.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Schedule Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: Center(
            child: PopUpDialogWidgetWidget(),
          )),
    );
  }
}
