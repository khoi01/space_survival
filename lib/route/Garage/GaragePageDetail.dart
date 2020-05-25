import 'package:flutter/material.dart';

class GarageDetailUI extends StatelessWidget {
  const GarageDetailUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("My Garage",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
      ),
    );
  }
}