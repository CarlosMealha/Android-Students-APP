import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:flutter/foundation.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';


class ScheduleTopBar extends StatelessWidget {
  ScheduleTopBar(
      {Key key,
      @required this.aggLectures});

  final List<List<Lecture>> aggLectures;

  @override
  Widget build(BuildContext context) {
    return createTopBar(context);
  }

  Widget createActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Adicionar Eventos!!!'),
                content: Container(
                  height: 200.0,
                  width: 100.0,
                ),
                actions: [
                  TextButton(
                      child: Text('Cancelar'),
                      onPressed: () => Navigator.pop(context))
                ]);
          }), //Add FAB functionality here
      tooltip: 'Adicionar widget',
      child: Icon(Icons.add),
    );
  }

  Widget createTopBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Center(
            child: Text(
          Constants.navSchedule,
          style:
              Theme.of(context).textTheme.headline3.apply(fontSizeFactor: 1.5),
        )),
        Container(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
                onTap: () => StoreProvider.of<AppState>(context).dispatch(
                    SetSchedulePageEditingMode(!this.isEditing(context))),
                child: Text(
                    this.isEditing(context) ? 'Concluir Edição' : 'Editar',
                    style: Theme.of(context).textTheme.caption))),
        Container(
            alignment: Alignment.bottomLeft,
            child: GestureDetector(
                onTap: () => exportToCSV(),
                child: Text(
                    'Exportar',
                    style: Theme.of(context).textTheme.caption)))
      ]),
    );
  }

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    if (result == null) return false;
    return result;
  }

  exportToCSV() async{
    String selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory == null) {
      return;
    }
    List<List<String>> rows = List();
    rows.add(['Subject', 'Day', 'Start', 'End']);

    for (var i = 1; i < aggLectures.length; i++) {
      for(var j = 0; j < aggLectures[i].length; j++){    
        List<String> row = new List();
        final sub = aggLectures[i][j].subject;
        final start = aggLectures[i][j].startTime;
        final end = aggLectures[i][j].endTime;
        final type = aggLectures[i][j].typeClass;
        final room = aggLectures[i][j].room;
        final teacher = aggLectures[i][j].teacher;
        final classNumber = aggLectures[i][j].classNumber;
        final day = aggLectures[i][j].day.toString();
        final blocks = aggLectures[i][j].blocks.toString();
        final startSeconds = aggLectures[i][j].startTimeSeconds.toString();

        row.add(sub);

        switch(day) {
          case '0': {
            row.add('Segunda-feira');
          }
          break;
          case '1': {
            row.add('Terça-feira');
          }
          break;
          case '2': {
            row.add('Quarta-feira');
          }
          break;
          case '3': {
            row.add('Quinta-feira');
          }
          break;
          case '4': {
            row.add('Sexta-feira');
          }
          break;
          case '5': {
            row.add('Sábado');
          }
          break;
          case '6': {
            row.add('Domingo');
          }
          break;
        }

        row.add(start);
        row.add(end);
        rows.add(row);
      }
    }
    
    String csv = const ListToCsvConverter().convert(rows);
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = selectedDirectory + "/myCsvFile.csv";
    File file = await File(pathOfTheFileToWrite);
    file.writeAsString(csv);
  }

}