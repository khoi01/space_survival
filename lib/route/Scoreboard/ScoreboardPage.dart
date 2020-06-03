import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/repository/ScoreRepository.dart';
import 'package:space_survival/route/Scoreboard/ScoreboardPageDetail.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({Key key}) : super(key: key);

  @override
  _ScoreboardPageState createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {

  double coin;
  int highestScore;
  Stage stage;
  

  @override
  void initState() { 
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          isDataAvailable() ?  CustomWidget.backButton(context,Routes.main_page,coin,isRemovePreviousBackStack: true) : Text(""),
          ScoreboardHeaderUI(),
          isDataAvailable() ? ScoreboardHighestScoreUI(highestScore: highestScore,highestStage: stage,) : Text(""),
        ],
      ),
    );
  }


  bool isDataAvailable(){
    return coin != null && highestScore != null && stage != null ? true : false;
  }
  void getData(){

    ScoreRepository.getHighestScore().then((value) {
        setState(() {
          highestScore = value; 
        });
    });

    CoinRepository.getCoin().then((value) {
        setState(() {
          coin = value;
        });

    });


    ScoreRepository.getHighestStage().then((value) => setState((){stage = value; }));

  }
}