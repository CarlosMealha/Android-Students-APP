import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Widgets/row_container.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/view/Widgets/schedule_add.dart';

class ScheduleSlot extends StatefulWidget {
  final String subject;
  final int day;
  final String rooms;
  final String begin;
  final String end;
  final String teacher;
  final String typeClass;
  final String classNumber;

  ScheduleSlot({
    Key key,
    @required this.subject,
    @required this.day,
    @required this.typeClass,
    @required this.rooms,
    @required this.begin,
    @required this.end,
    this.teacher,
    this.classNumber,
  }) : super(key: key);

  @override
  State<ScheduleSlot> createState() => ScheduleSlotState();
}

class ScheduleSlotState extends State<ScheduleSlot> {
  @override
  Widget build(BuildContext context) {
    return RowContainer(
        child: Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
      child: createScheduleSlotRow(context),
    ));
  }

  Widget createScheduleSlotRow(
    context,
  ) {
    return Container(
        key: Key('schedule-slot-time-${this.widget.begin}-${this.widget.end}'),
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
      key: Key('schedule-slot-time-${this.widget.begin}-${this.widget.end}'),
      children: <Widget>[
        createScheduleTime(this.widget.begin, context),
        createScheduleTime(this.widget.end, context)
      ],
    );
  }

  Widget createScheduleTime(String time, context) => createTextField(
      time,
      Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
      TextAlign.center);

  List<Widget> createScheduleSlotPrimInfo(context) {
    final subjectTextField = createTextField(
        this.widget.subject,
        Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 5),
        TextAlign.center);
    final typeClassTextField = createTextField(
        ' (' + this.widget.typeClass + ')',
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);
    final roomTextField = createTextField(
        this.widget.rooms,
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

  Widget createScheduleSlotTeacherInfo(context) {
    return createTextField(
        this.widget.teacher,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.center);
  }

  Widget createScheduleSlotClass(context) {
    final classText = this.widget.classNumber != null
        ? (' | ' + this.widget.classNumber)
        : '';
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

  Lecture LectureBuilder2() {
    return Lecture(
      this.widget.subject,
      this.widget.typeClass,
      this.widget.day,
      1,
      this.widget.rooms,
      this.widget.teacher,
      this.widget.classNumber,
      int.parse(this.widget.begin.substring(0, 2)),
      int.parse(this.widget.begin.substring(4, 6)),
      int.parse(this.widget.end.substring(0, 2)),
      int.parse(this.widget.end.substring(4, 6)),
    );
  }
}
