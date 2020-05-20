import 'package:flutter/material.dart';
import 'package:space_survival/util.dart';

class LostPage extends StatelessWidget {

  final int score;

  const LostPage({Key key, this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
        body: ListView(
          children: <Widget>[
            Text("You Score:${score.toString()}"),
            Text("You Lost!"),
            RaisedButton(child:Text("Retry"),
            onPressed:(){
              Nav.route(context,Routes.main_game,null,isRemovePreviousBackStack: true);
            }),
            RaisedButton(
            child: Text("Home"),
            onPressed: (){
              Nav.route(context,Routes.main_page,null,isRemovePreviousBackStack: true);

            })
          ],
        )
      );
  }
}