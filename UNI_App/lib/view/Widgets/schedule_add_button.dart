import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/actions.dart';
import 'package:uni/utils/constants.dart' as Constants;

class ScheduleAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          this.isEditing(context) ? createActionButton(context) : null,
    );
  }

  Widget createActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text('Adicionar Eventos!!!'),
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
      child: Icon(Icons.add),
    );
  }

  bool isEditing(context) {
    final bool result = StoreProvider.of<AppState>(context)
        .state
        .content['schedulePageEditingMode'];
    if (result == null) return false;
    return result;
  }
}
