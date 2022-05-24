import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckUCButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final UCButton = find.byValueKey(input1);

    bool UCButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, UCButton);

    expect(UCButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'that I have {string} button');
}

class TapUCButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Editbtn) async {
    final UCfinder = find.byValueKey(Editbtn);
    await FlutterDriverUtils.tap(world.driver, UCfinder);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {string} button');
}

class CheckUCInfoFields extends Then4WithWorld<String, String, String,
    String, FlutterWorld> {
  @override
  Future<void> executeStep(String sbjctField, String typeField,
      String teacherField, String dayField) async {
    final sbjctFieldFinder = find.byValueKey(sbjctField);
    final typeFieldFinder = find.byValueKey(typeField);
    final teacherFieldFinder = find.byValueKey(teacherField);
    final dayFieldFinder = find.byValueKey(dayField);

    bool sbjctFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, sbjctFieldFinder);
    bool typeFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, typeFieldFinder);
    bool teacherFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, teacherFieldFinder);
    bool dayFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, dayFieldFinder);

    expect(sbjctFieldExists, true);
    expect(typeFieldExists, true);
    expect(teacherFieldExists, true);
    expect(dayFieldExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'I expect the four UC information fields to be '
  r'present');
}

class CheckTwoTimeInfoFields extends Then2WithWorld<String, String,
    FlutterWorld> {
  @override
  Future<void> executeStep(String startTimeField,String endTimeField) async {
    final startTimeFieldFinder = find.byValueKey(startTimeField);
    final endTimeFieldFinder = find.byValueKey(endTimeField);

    bool startTimeFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, startTimeFieldFinder);
    bool endTimeFieldExists =
        await FlutterDriverUtils.isPresent(world.driver, endTimeFieldFinder);

    expect(startTimeFieldExists, true);
    expect(endTimeFieldExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'I expect the two UC time information fields to'
  r' be present');
}

class CheckAcceptAndCancelButtons extends Then2WithWorld<String, String,
    FlutterWorld> {
  @override
  Future<void> executeStep(String acceptButton, String cancelButton) async {
    final acceptButtonFinder = find.byValueKey(acceptButton);
    final cancelButtonFinder = find.byValueKey(cancelButton);

    bool acceptButtonExists =
    await FlutterDriverUtils.isPresent(world.driver, acceptButtonFinder);
    bool cancelButtonExists =
    await FlutterDriverUtils.isPresent(world.driver, cancelButtonFinder);

    expect(acceptButtonExists, true);
    expect(cancelButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'I expect the {string} and {string} buttons to '
  r'be present');
}