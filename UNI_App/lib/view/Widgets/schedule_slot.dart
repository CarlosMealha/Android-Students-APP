import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tuple/tuple.dart';
import 'package:uni/controller/local_storage/app_shared_preferences.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:uni/view/Widgets/schedule_add.dart';

class ScheduleSlot extends StatelessWidget {
  final String subject;
  final String rooms;
  final String begin;
  final int day;
  final String end;
  final String teacher;
  final String typeClass;
  final String classNumber;

  ScheduleSlot({
    Key key,
    @required this.subject,
    @required this.typeClass,
    @required this.rooms,
    @required this.day,
    @required this.begin,
    @required this.end,
    this.teacher,
    this.classNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowContainer(
        child: Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
      child: createScheduleSlotRow(context),
    ));
  }

  Widget createScheduleSlotRow(context) {
    return Container(
        key: Key('schedule-slot-time-${this.begin}-${this.end}'),
        margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createScheduleSlotPrimInfo(context),
        ));
  }

  Widget createScheduleSlotTime(context) {
    return Column(
      key: Key('schedule-slot-time-${this.begin}-${this.end}'),
      children: <Widget>[
        createScheduleTime(this.begin, context),
        createScheduleTime(this.end, context)
      ],
    );
  }

  Widget createScheduleTime(String time, context) => createTextField(
      time,
      Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
      TextAlign.center);

  List<Widget> createScheduleSlotPrimInfo(context) {
    final subjectTextField = createTextField(
        this.subject,
        Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 5),
        TextAlign.center);
    final typeClassTextField = createTextField(
        ' (' + this.typeClass + ')',
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);
    final roomTextField = createTextField(
        this.rooms,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.right);
    return [
      createScheduleSlotTime(context),
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              subjectTextField,
              typeClassTextField,
            ],
          ),
          Row(
            children: [
              createScheduleSlotTeacherInfo(context),
              createScheduleSlotClass(context)
            ],
          )
        ],
      ),
      Column(children: <Widget>[
        isEditing(context)
            ? IconButton(
                iconSize: 25,
                icon: const Icon(Icons.edit),
                tooltip: 'Edit Class',
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => StatefulBuilder(
                        builder: (context, StateSetter setState) =>
                            getEditingMenu(context, setState))))
            : SizedBox(),
        createScheduleSlotPrimInfoColumn(roomTextField),
      ])
    ];
  }

  Widget getEditingMenu(BuildContext context, StateSetter setState) =>
      AlertDialog(
          title: Text('Adicionar Unidade Curricular'),
          content: Container(
            child: Form(
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
              buildRemoveButton(context, setState)
            ])
          ]);

  Widget createScheduleSlotTeacherInfo(context) {
    return createTextField(
        this.teacher,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);
  }

  Widget createScheduleSlotClass(context) {
    final classText =
        this.classNumber != null ? (' | ' + this.classNumber) : '';
    return createTextField(
        classText,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);
  }

  Widget createTextField(text, style, alignment) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }

  Widget createScheduleSlotPrimInfoColumn(elements) {
    return Container(child: elements);
  }

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    return (result == null) ? false : result;
  }

  Widget buildRemoveButton(BuildContext context, StateSetter setState) =>
      TextButton(
          child: Text('Remover'),
          onPressed: () async {
            //if (stopData.configuredBuses.isNotEmpty) {
            final Tuple2<String, String> userPersistentInfo =
                await AppSharedPreferences.getPersistentUserInfo();
            StoreProvider.of<AppState>(context).dispatch(removeUserClass(
                Completer(),
                await LectureBuilder2(context),
                userPersistentInfo));
            Navigator.pop(context);
            //}
            setState(() {});
          });

  Future<Lecture> LectureBuilder2(context) async {
    return Lecture(
      this.subject,
      this.typeClass,
      this.day,
      1,
      this.rooms,
      this.teacher,
      this.classNumber,
      int.parse(this.begin.substring(0, 2)),
      int.parse(this.begin.substring(3, 5)),
      int.parse(this.end.substring(0, 2)),
      int.parse(this.end.substring(3, 5)),
    );
  }
}
