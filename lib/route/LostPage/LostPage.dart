import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/adMob/ad_manager.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/repository/ScoreRepository.dart';

class LostPage extends StatelessWidget {
  final int score;
  final Stage stage;
  final double coin;
  const LostPage({Key key, this.score, this.stage, this.coin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoinRepository.addCoin(coin);
    ScoreRepository.setHighestScore(score);
    ScoreRepository.setHighestStage(stage);

    return Scaffold(
        backgroundColor: AppConfig.backgroundColor,
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            new Image.asset(
              "assets/images/defeat/defeat.gif",
              height: 200.0,
              width: 250.0,
            ),
            Text(
              "Score: ${score.toString()}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              "stage: ${stage.toString()}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/coin/coin.gif',
                  height: 60,
                  width: 60,
                ),
                Text(
                  "${coin.toString()}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            RaisedButton(
                child: Text("Retry"),
                onPressed: () {
                  Nav.route(context, Routes.select_vehicle_page, null,
                      isRemovePreviousBackStack: true);
                }),
            RaisedButton(
                child: Text("Home"),
                onPressed: () {
                  // if (AdManager.isShowRewardAds()) {
                  Nav.route(context, Routes.reward_ad_page, null,
                      isRemovePreviousBackStack: true);
                  // } else {
                  //   Nav.route(context, Routes.main_page, null,
                  //       isRemovePreviousBackStack: true);
                  // }
                })
          ],
        ));
  }
}
