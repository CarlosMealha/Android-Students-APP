import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:gherkin/gherkin.dart';
import 'package:uni/utils/constants.dart' as Constants;

class CheckGivenWidgets
    extends Given4WithWorld<String, String, String, String, FlutterWorld> {
  @override
  Future<void> executeStep(
      String input1, String input2, String input3, String input4) async {
    final button1 = find.byValueKey(input1);
    final button2 = find.byValueKey(input2);
    final button3 = find.byValueKey(input3);
    final button4 = find.byValueKey(input4);

    bool button1Exists =
        await FlutterDriverUtils.isPresent(world.driver, button1);
    bool button2Exists =
        await FlutterDriverUtils.isPresent(world.driver, button2);
    bool button3Exists =
        await FlutterDriverUtils.isPresent(world.driver, button3);
    bool button4Exists =
        await FlutterDriverUtils.isPresent(world.driver, button4);

    expect(button1Exists, true);
    expect(button2Exists, true);
    expect(button3Exists, true);
    expect(button4Exists, true);
  }

  @override
  RegExp get pattern => RegExp("I have {string} and {string} and {string}");
}

/*StepDefinitionGeneric pageNavigation() {
  return given1<String, FlutterWorld>('I navigate to the {string} page',
      (page, context) async {
    String pageRoute;
    switch (page) {
      case 'Horário':
        pageRoute = Constants.navSchedule;
        break;
      default:
        pageRoute = Constants.navPersonalArea;
    }

    final pageFinder = find.text(pageRoute);
    await FlutterDriverUtils.tap(context.world.driver, pageFinder);
  });*/

