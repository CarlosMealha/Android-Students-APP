import 'package:flutter/material.dart';

class addFriendMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: createActionButton(context));
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
}
