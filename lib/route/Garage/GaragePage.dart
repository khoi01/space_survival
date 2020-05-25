import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/route/Garage/GaragePageDetail.dart';

class GaragePage extends StatefulWidget {
  GaragePage({Key key}) : super(key: key);

  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
       body: ListView(
         shrinkWrap: true,
         children: <Widget>[
           CustomWidget.backButton(context,Routes.main_page,isRemovePreviousBackStack: true),
          GarageDetailUI(),
         ],
       ),
    );
  }
}