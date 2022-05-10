import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:uni/view/theme.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ScheduleAddButton extends StatefulWidget {
  @override
  State<ScheduleAddButton> createState() => _ScheduleAddButtonState();
}

class _ScheduleAddButtonState extends State<ScheduleAddButton> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  final UCvalues = List.filled(7, false);
  final ECvalues = List.filled(7, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          this.isEditing(context) ? createActionButton(context) : null,
    );
  }

  Widget createActionButton(BuildContext context) {
    return SpeedDial(
      animatedIconTheme: IconThemeData(size: 22.0),
      child: Icon(Icons.add),
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      icon: Icons.add,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: Icon(Icons.work),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF35424a),
          //backgroundColor: Color(0x35424a),
          label: 'Unidade Curricular',
          onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                  return AlertDialog(
                      title: Text('Adicionar Unidade Curricular'),
                      content: Container(
                        //child: ListView(children: getCardAdders(context)),
                        child: getUCMenu(context, setState),
                        height: 400.0,
                        width: 100.0,
                      ),
                      actions: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                  child: Text('Cancelar'),
                                  onPressed: () => Navigator.pop(context)),
                              TextButton(
                                  child: Text('Adicionar'),
                                  // Criar Lecture
                                  // Adicionar Lecture
                                  // Fazer o resto do projeto
                                  onPressed: () => Navigator.pop(context))
                            ])
                      ]);
                });
              }), //Add FAB functionality here
        ),
        SpeedDialChild(
          child: Icon(Icons.rowing),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF35424a),
          label: 'Extra Curricular',
          onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (context, StateSetter setState) {
                  return AlertDialog(
                      title: Text('Adicionar Atividade Extracurricular'),
                      content: Container(
                        child: getExtraCMenu(context, setState),
                        height: 400.0,
                        width: 100.0,
                      ),
                      actions: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                  child: Text('Cancelar'),
                                  // Criar Lecture
                                  // Adicionar Lecture
                                  // Fazer o resto do projeto
                                  onPressed: () => Navigator.pop(context)),
                              TextButton(
                                  child: Text('Adicionar'),
                                  onPressed: () => Navigator.pop(context))
                            ])
                      ]);
                });
              }), //Add FAB functionality here
        ),
      ],
    );
  }

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    if (result == null) return false;
    return result;
  }

  Widget getUCMenu(BuildContext context, StateSetter setState) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
        Widget>[
      Container(
        width: 200.0,
        child: TextField(
          style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Nome da Atividade'),
        ),
      ),
      Container(
        width: 200.0,
        child: TextField(
          style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Local'),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Text('Hora de Início: '),
        ElevatedButton(
          onPressed: () {
            _selectStartTime(context, setState);
          },
          child: Text('${startTime.hour}:${startTime.minute}'),
        ),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Text('Hora de Fim: '),
        ElevatedButton(
          onPressed: () {
            _selectEndTime(context, setState);
          },
          child: Text('${endTime.hour}:${endTime.minute}'),
        ),
      ]),
      WeekdaySelector(
        selectedFillColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
        shortWeekdays: ['D', '2ª', '3ª', '4ª', '5ª', '6ª', 'S'],
        firstDayOfWeek: DateTime.sunday,
        displayedDays: {
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
        },
        onChanged: (int day) {
          setState(() {
            final index = day % 7;
            UCvalues[index] = !UCvalues[index];
          });
        },
        values: UCvalues,
      )
    ]);
  }

  Widget getExtraCMenu(BuildContext context, StateSetter setState) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
        Widget>[
      Container(
        width: 200.0,
        child: TextField(
          style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Nome da Atividade'),
        ),
      ),
      Container(
        width: 200.0,
        child: TextField(
          style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Local'),
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Text('Hora de Início: '),
        ElevatedButton(
          onPressed: () {
            _selectStartTime(context, setState);
          },
          child: Text('${startTime.hour}:${startTime.minute}'),
        ),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Text('Hora de Fim: '),
        ElevatedButton(
          onPressed: () {
            _selectEndTime(context, setState);
          },
          child: Text('${endTime.hour}:${endTime.minute}'),
        ),
      ]),
      WeekdaySelector(
        selectedFillColor: Color.fromARGB(255, 0x75, 0x17, 0x1e),
        shortWeekdays: ['D', '2ª', '3ª', '4ª', '5ª', '6ª', 'S'],
        firstDayOfWeek: DateTime.sunday,
        displayedDays: {
          DateTime.monday,
          DateTime.tuesday,
          DateTime.wednesday,
          DateTime.thursday,
          DateTime.friday,
        },
        onChanged: (int day) {
          setState(() {
            final index = day % 7;
            ECvalues[index] = !ECvalues[index];
          });
        },
        values: ECvalues,
      )
    ]);
  }

  _selectStartTime(BuildContext context, StateSetter setState) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: startTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != startTime) {
      setState(() {
        startTime = timeOfDay;
      });
    }
  }

  _selectEndTime(BuildContext context, StateSetter setState) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: endTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != endTime) {
      setState(() {
        endTime = timeOfDay;
      });
    }
  }
}
