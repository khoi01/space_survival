import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/route/Scoreboard/ScoreboardPageDetail.dart';

class ScoreboardPage extends StatelessWidget {
  const ScoreboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CustomWidget.backButton(context,Routes.main_page,isRemovePreviousBackStack: true),
          ScoreboardHeaderUI(),
        ],
      ),
    );
  }
}