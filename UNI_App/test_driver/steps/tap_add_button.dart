import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckAddButton extends Given1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String input1) async {
    final addButton = find.byValueKey(input1);

    bool addButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, addButton);

    expect(addButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'that I have {string} button');
}

class TapAddButton extends When1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Addbtn) async {
    final Addfinder = find.byValueKey(Addbtn);
    await FlutterDriverUtils.tap(world.driver, Addfinder);
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {string} button');
}

class CheckUCButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String UCbtn) async {
    final UCButton = find.byValueKey(UCbtn);
    bool UCButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, UCButton);

    expect(UCButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'The button {string} should be present');
}

class CheckExcButton extends Then1WithWorld<String, FlutterWorld> {
  @override
  Future<void> executeStep(String Excbtn) async {
    final excButton = find.byValueKey(Excbtn);
    bool excButtonExists =
        await FlutterDriverUtils.isPresent(world.driver, excButton);

    expect(excButtonExists, true);
  }

  @override
  RegExp get pattern => RegExp(r'The button {string} should be present');
}
