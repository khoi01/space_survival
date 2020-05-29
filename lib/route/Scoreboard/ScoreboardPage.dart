import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/route/Scoreboard/ScoreboardPageDetail.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key key}) : super(key: key);

  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {

  double coin;
  @override
  void initState() { 
    super.initState();
    CoinRepository.getCoin().then((value) {
        setState(() {
          coin = value;
        });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CustomWidget.backButton(context,Routes.main_page,coin,isRemovePreviousBackStack: true),
          ScoreboardHeaderUI(),
        ],
      ),
    );
  }
}