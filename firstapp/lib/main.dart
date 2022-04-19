import 'dart:async';

import 'package:firstapp/view/Widgets/PopUpDialog.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/view/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Schedule Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Schedule V2",
      home: Scaffold(
          body: Center(
        child: PopUpDialogWidgetWidget(),
      )),
    );
  }
}
