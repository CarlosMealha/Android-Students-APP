import 'package:firstapp/UI/PopUpDialog.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Schedule Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          body: Center(
        child: PopUpDialogWidgetWidget(),
      )),
    );
  }
}
