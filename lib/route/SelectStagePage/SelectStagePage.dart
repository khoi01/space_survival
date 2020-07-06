
import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';

class SelectStagePage extends StatefulWidget {
  
  SelectStagePage({Key key}) : super(key: key);

  @override
  _SelectStagePageState createState() => _SelectStagePageState();
}

class _SelectStagePageState extends State<SelectStagePage> {
  double coin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CustomWidget.backButton(context,Routes.main_game, coin,isRemovePreviousBackStack: true),
          
        ],
      ),
    );
  }
}