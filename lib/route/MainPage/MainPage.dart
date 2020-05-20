import 'package:flutter/material.dart';
import 'package:space_survival/util.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
        body: ListView(
          children: <Widget>[
            RaisedButton(child: Text("Start Game"),
            onPressed: () {
              Nav.route(context,Routes.main_game,null);
            },)
          ],
        )
      );
  }
}