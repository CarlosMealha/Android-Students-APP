import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ScheduleAddButton extends StatelessWidget {
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
                    title: Text('Adicionar Uc!!!!!'),
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
                    title: Text('Adicionar ExtraCurricular!!!!!'),
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
  /*
  Widget createDefaultAddButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Column(
        children: <Widget>[
          Positioned(bottom: 10, child: createUCActionButton(context)),
          Positioned(bottom: 10, child: createExtraCurricularActionButton(context))
        ],
      ), //Add FAB functionality here
      tooltip: 'Adicionar widget',
      child: Icon(Icons.add),
    );
  }

  Widget createUCActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Adicionar Uc!!!!!'),
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
      child: Icon(Icons.work),
    );
  }

  Widget createExtraCurricularActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Adicionar ExtraCurricular!!!!!'),
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
      child: Icon(Icons.rowing),
    );
  }
  */
}
