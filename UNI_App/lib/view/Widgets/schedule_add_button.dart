import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:weekday_selector/weekday_selector.dart';

class ScheduleAddButton extends StatefulWidget {
  @override
  State<ScheduleAddButton> createState() => _ScheduleAddButtonState();
}

class _ScheduleAddButtonState extends State<ScheduleAddButton> {
  TimeOfDay selectedTime = TimeOfDay.now();
  final values = List.filled(7, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          this.isEditing(context) ? createActionButton(context) : null,
    );
  }

  Widget createActionButton(BuildContext context) {
    return SpeedDial(
      //animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // this is ignored if animatedIcon is non null
      child: Icon(Icons.add),
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      //onOpen: () => print('OPENING DIAL'),
      //onClose: () => print('DIAL CLOSED'),
      tooltip: 'Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      //backgroundColor: Colors.white,
      //foregroundColor: Colors.black,
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
                return AlertDialog(
                    title: Text('Adicionar Unidade Curricular'),
                    content: Container(
                      //child: ListView(children: getCardAdders(context)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome da Atividade'),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Local'),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Hora de Início: '),
                                  ElevatedButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    child: Text(
                                        '${selectedTime.hour}:${selectedTime.minute}'),
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Hora de Fim: '),
                                  ElevatedButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    child: Text(
                                        '${selectedTime.hour}:${selectedTime.minute}'),
                                  ),
                                ]),
                            WeekdaySelector(
                              firstDayOfWeek: DateTime.monday,
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
                                  values[index] = !values[index];
                                });
                              },
                              values: values,
                            )
                          ]),
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
                                onPressed: () => Navigator.pop(context))
                          ])
                    ]);
              }), //Add FAB functionality here
        ),
        SpeedDialChild(
          child: Icon(Icons.rowing),
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF35424a),
          label: 'Extra Curricular',
          //labelStyle: TextTheme(fontSize: 18.0),
          onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Adicionar Atividade Extracurricular'),
                    content: Container(
                      //child: ListView(children: getCardAdders(context)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome da Atividade'),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Local'),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Hora de Início: '),
                                  ElevatedButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    child: Text(
                                        '${selectedTime.hour}:${selectedTime.minute}'),
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Hora de Fim: '),
                                  ElevatedButton(
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    child: Text(
                                        '${selectedTime.hour}:${selectedTime.minute}'),
                                  ),
                                ]),
                            WeekdaySelector(
                              firstDayOfWeek: DateTime.monday,
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
                                  values[index] = !values[index];
                                });
                              },
                              values: values,
                            )
                          ]),
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
                                onPressed: () => Navigator.pop(context))
                          ])
                    ]);
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

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
