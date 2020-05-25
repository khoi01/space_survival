import 'package:flutter/material.dart';

class TutorialHeaderUI extends StatelessWidget {
  const TutorialHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Tutorial",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
      ),
    );
  }
}