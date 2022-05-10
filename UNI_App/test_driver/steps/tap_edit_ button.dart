import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckEditButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final editButton = find.byValueKey(input1);

    bool editButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, editButton);

    expect(editButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'that I have {string} button');
}

class TapEditButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Editbtn) async {
    final Editfinder = find.byValueKey(Editbtn);
    await FlutterDriverUtils.tap(world.driver, Editfinder);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {string} button');
}

class CheckAddButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String addbtn) async {
    final addButton = find.byValueKey(addbtn);
    bool addButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, addButton);

    expect(addButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'I expect the button {string} to be present');
}

class CheckConcludeButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String concludebtn) async {
    final concludeButton = find.byValueKey(concludebtn);
    bool concludeButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, concludeButton);

    expect(concludeButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'I expect the button {string} to be present');
}
