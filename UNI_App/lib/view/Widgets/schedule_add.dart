import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/local_storage/app_shared_preferences.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:uni/view/Pages/schedule_page_view.dart';
import 'package:uni/view/theme.dart';
import 'package:weekday_selector/weekday_selector.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/controller/local_storage/app_lectures_database.dart';
import 'package:uni/view/Widgets/schedule_slot.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String subject;
String typeClass;
int day;
int blocks;
String room;
String teacher;
String classNumber;
int startTimeHours;
int startTimeMinutes;
int endTimeHours;
int endTimeMinutes;

TimeOfDay startTime = TimeOfDay.now();
TimeOfDay endTime = TimeOfDay.now();
final values = List.filled(7, false);

class ScheduleAdd extends StatefulWidget {
  @override
  State<ScheduleAdd> createState() => _ScheduleAddState();
}

class _ScheduleAddState extends State<ScheduleAdd> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton:
            this.isEditing(context) ? createActionButton(context) : null,
      );

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    return (result == null) ? false : result;
  }
}

Widget createActionButton(BuildContext context) => SpeedDial(
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
            key: Key('UC'),
            child: Icon(Icons.work),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF35424a),
            label: 'Unidade Curricular',
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => StatefulBuilder(
                    builder: (context, StateSetter setState) =>
                        getUCMenu(context, setState)))),
        SpeedDialChild(
            key: Key('ExC'),
            child: Icon(Icons.rowing),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF35424a),
            label: 'Extra Curricular',
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => StatefulBuilder(
                    builder: (context, StateSetter setState) =>
                        getExtraCMenu(context, setState)))),
      ],
    );

Widget getUCMenu(BuildContext context, StateSetter setState) => AlertDialog(
        title: Text('Adicionar Unidade Curricular'),
        content: Container(
          child: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(16), children: [
              buildSubjectField(),
              const SizedBox(height: 16),
              buildTypeClassField(),
              const SizedBox(height: 16),
              buildRoomField(),
              const SizedBox(height: 16),
              buildTeacherField(),
              const SizedBox(height: 16),
              buildStartTimeField(context, setState),
              const SizedBox(height: 16),
              buildEndTimeField(context, setState),
              const SizedBox(height: 16),
              buildWeekDayField(setState)
            ]),
          ),
          height: 475.0,
          width: 125.0,
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            buildCancelButton(context),
            buildAcceptButton(context, setState)
          ])
        ]);

Widget getExtraCMenu(BuildContext context, StateSetter setState) => AlertDialog(
        title: Text('Adicionar Extra Curricular'),
        content: Container(
          child: Form(
            key: _formKey,
            child: ListView(padding: EdgeInsets.all(16), children: [
              buildSubjectField(),
              const SizedBox(height: 16),
              buildTypeClassField(),
              const SizedBox(height: 16),
              buildRoomField(),
              const SizedBox(height: 16),
              buildTeacherField(),
              const SizedBox(height: 16),
              buildStartTimeField(context, setState),
              const SizedBox(height: 16),
              buildEndTimeField(context, setState),
              const SizedBox(height: 16),
              buildWeekDayField(setState)
            ]),
          ),
          height: 475.0,
          width: 125.0,
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            buildCancelButton(context),
            buildAcceptButton(context, setState)
          ])
        ]);

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

Widget buildSubjectField() => TextFormField(
      key: Key('subject field'),
      style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Subject',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => subject = value,
    );

Widget buildTypeClassField() => TextFormField(
      key: Key('type field'),
      style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Class',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => typeClass = value,
    );

Widget buildRoomField() => TextFormField(
      key: Key('room field'),
      style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Room',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => room = value,
    );

Widget buildTeacherField() => TextFormField(
      key: Key('teacher field'),
      style: TextStyle(fontSize: 15.0, height: 1, color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Teacher',
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => teacher = value,
    );

Widget buildStartTimeField(BuildContext context, StateSetter setState) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
      Text('Hora de Início: '),
      ElevatedButton(
        key: Key('start time field'),
        onPressed: () {
          _selectStartTime(context, setState);
        },
        child: Text('${startTime.hour}:${startTime.minute}'),
      ),
    ]);

Widget buildEndTimeField(BuildContext context, StateSetter setState) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
      Text('Hora de Fim: '),
      ElevatedButton(
        key: Key('end time field'),
        onPressed: () {
          _selectEndTime(context, setState);
        },
        child: Text('${endTime.hour}:${endTime.minute}'),
      ),
    ]);

Widget buildWeekDayField(StateSetter setState) => WeekdaySelector(
      key: Key('day field'),
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
          values[index] = !values[index];
        });
      },
      values: values,
    );

Widget buildCancelButton(BuildContext context) => TextButton(
    key: Key('cancel'),
    child: Text('Cancelar'),
    onPressed: () => Navigator.pop(context));

Widget buildAcceptButton(BuildContext context, StateSetter setState) =>
    TextButton(
        key: Key('accept'),
        child: Text('Adicionar'),
        onPressed: () async {
          //if (stopData.configuredBuses.isNotEmpty) {
          final Tuple2<String, String> userPersistentInfo =
              await AppSharedPreferences.getPersistentUserInfo();
          StoreProvider.of<AppState>(context).dispatch(
              addUserClass(Completer(), LectureBuilder(), userPersistentInfo));
          Navigator.pop(context);
          //}
          setState(() {});
        });

Lecture LectureBuilder() {
  startTimeHours = startTime.hour;
  startTimeMinutes = startTime.minute;
  endTimeHours = endTime.hour;
  endTimeMinutes = endTime.minute;

  for (int i = 0; i < 7; i++) {
    if (values[i]) {
      return (Lecture(subject, 'TP', i - 1, 1, room, teacher, classNumber,
          startTimeHours, startTimeMinutes, endTimeHours, endTimeMinutes));
    }
  }
}
