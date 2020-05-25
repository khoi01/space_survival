import 'package:flutter/material.dart';

class ScoreboardHeaderUI extends StatelessWidget {
  const ScoreboardHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Scoreboard",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
      ),
    );
  }
}