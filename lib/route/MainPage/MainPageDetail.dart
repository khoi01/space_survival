import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/adMob/ad_manager.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/repository/ScoreRepository.dart';

class MainTopUI extends StatefulWidget {
  const MainTopUI({Key key}) : super(key: key);

  @override
  _MainTopUIState createState() => _MainTopUIState();
}

class _MainTopUIState extends State<MainTopUI> {
  double coin;
  int score;

  @override
  void initState() {
    super.initState();

    CoinRepository.getCoin().then((value) {
      setState(() {
        coin = value;
      });
    });

    ScoreRepository.getHighestScore().then((value) {
      setState(() {
        score = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
            child: Text(
          "High Score: $score",
          style: TextStyle(fontSize: 20),
        )),
        Container(
          child: Row(
            children: [
              new Image.asset(
                "assets/images/coin/coin.gif",
                height: 50.0,
                width: 50.0,
              ),
              Text(
                coin.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppConfig.backgroundColor,
                    shape: const RoundedRectangleBorder(),
                    shadowColor: null,
                  ),
                  onPressed: () {
                    MusicConfig.stopBgmRoute();

                    if (AdManager.isRewardedAdReady) {
                      Nav.route(context, Routes.reward_ad_page, null,
                          isRemovePreviousBackStack: true);
                    } else {
                      setState(() {
                        AdManager.loadRewardedAd();
                      });
                    }
                  },
                  icon: Icon(Icons.card_giftcard),
                  label: Text("Reward"))
              // FlatButton.icon(
              //     onPressed: () {
              //       MusicConfig.stopBgmRoute();

              //       if (AdManager.isRewardedAdReady) {
              //         Nav.route(context, Routes.reward_ad_page, null,
              //             isRemovePreviousBackStack: true);
              //       } else {
              //         setState(() {
              //           AdManager.loadRewardedAd();
              //         });
              //       }
              //     },
              //     icon: Icon(Icons.card_giftcard),
              //     label: Text("Reward")) (Deprecated)
            ],
          ),
        )
      ]),
    );
  }
}

class MainHeaderUI extends StatelessWidget {
  const MainHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Image.asset(
            "assets/images/title/game_header.gif",
            height: 200.0,
            width: 250.0,
          )),
    );
  }
}

class MainBottomUI extends StatefulWidget {
  const MainBottomUI({Key key}) : super(key: key);

  @override
  _MainBottomUIState createState() => _MainBottomUIState();
}

class _MainBottomUIState extends State<MainBottomUI> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    initPackageInfo();
  }

  Future<void> initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Space Survival 2020 (v${_packageInfo.version})",
                style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold),
              ))),
    );
  }
}

class MainMenuUI extends StatefulWidget {
  MainMenuUI({Key key}) : super(key: key);

  @override
  _MainMenuUIState createState() => _MainMenuUIState();
}

class _MainMenuUIState extends State<MainMenuUI> {
  Stage highestStage;
  @override
  void initState() {
    super.initState();
  }

  bool isDataAvailable() {
    return highestStage != null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ElevatedButton(
            style: CustomWidget.flatButtonStyle,
            onPressed: () {
              // if(isDataAvailable()){
              // StageInfo.begin();
              // StageInfo stageInfo = StageInfo.getStage(highestStage);
              // if(stageInfo.difficulty >= 10){
              //   Nav.route(context, Routes.select_stage_page,null);
              // }else{
              Nav.route(context, Routes.select_vehicle_page, null);
              //   }
              // }
            },
            child: Text(
              "Start Game",
              style: TextStyle(fontSize: AppConfig.textBtnSize),
            ),
          ),
          // RaisedButton(
          //   child: Text(
          //     "Start Game",
          //     style: TextStyle(fontSize: AppConfig.textBtnSize),
          //   ),
          //   onPressed: () {
          //     // if(isDataAvailable()){
          //     // StageInfo.begin();
          //     // StageInfo stageInfo = StageInfo.getStage(highestStage);
          //     // if(stageInfo.difficulty >= 10){
          //     //   Nav.route(context, Routes.select_stage_page,null);
          //     // }else{
          //     Nav.route(context, Routes.select_vehicle_page, null);
          //     //   }
          //     // }
          //   },
          // ), (Deprecated)
          ElevatedButton(
              style: CustomWidget.flatButtonStyle,
              onPressed: () {
                Nav.route(context, Routes.tutorial_page, null);
              },
              child: Text("Tutorial",
                  style: TextStyle(fontSize: AppConfig.textBtnSize))),
          // RaisedButton(
          //   child: Text("Tutorial",
          //       style: TextStyle(fontSize: AppConfig.textBtnSize)),
          //   onPressed: () {
          //     Nav.route(context, Routes.tutorial_page, null);
          //   },
          // ),(Deprecated)
          ElevatedButton(
              style: CustomWidget.flatButtonStyle,
              onPressed: () {
                Nav.route(context, Routes.scoreboard_page, null);
              },
              child: Text("Scoreboard",
                  style: TextStyle(fontSize: AppConfig.textBtnSize)))
          // RaisedButton(
          //   child: Text("Scoreboard",
          //       style: TextStyle(fontSize: AppConfig.textBtnSize)),
          //   onPressed: () {
          //     Nav.route(context, Routes.scoreboard_page, null);
          //   },
          // )(Deprecated)
          // ,
          // RaisedButton(child: Text("Garage",style: TextStyle(fontSize: AppConfig.textBtnSize)),
          // onPressed: () {
          //   Nav.route(context,Routes.garage_page,null);
          // },)
          ,
          ElevatedButton(
              style: CustomWidget.flatButtonStyle,
              onPressed: () {
                Nav.route(context, Routes.store_page, null);
              },
              child: Text("Store",
                  style: TextStyle(fontSize: AppConfig.textBtnSize))),
          // RaisedButton(
          //   child: Text("Store",
          //       style: TextStyle(fontSize: AppConfig.textBtnSize)),
          //   onPressed: () {
          //     Nav.route(context, Routes.store_page, null);
          //   },
          // ),(Deprecated)
          ElevatedButton(
              style: CustomWidget.flatButtonStyle,
              onPressed: () {
                Nav.route(context, Routes.credits_page, null);
              },
              child: Text("Credit",
                  style: TextStyle(fontSize: AppConfig.textBtnSize)))
          // RaisedButton(
          //   child: Text("Credit",
          //       style: TextStyle(fontSize: AppConfig.textBtnSize)),
          //   onPressed: () {
          //     Nav.route(context, Routes.credits_page, null);
          //   },
          // ) (Deprecated)
        ],
      ),
    );
  }
}
