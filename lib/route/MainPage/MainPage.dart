import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/adMob/ad_manager.dart';
import 'package:space_survival/route/MainPage/MainPageDetail.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    // _initAdMob().then((value) {
    //   AdManager.loadRewardedAd();
    //   AdManager.isRewardedAdReady = true;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConfig.backgroundColor,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            MainTopUI(),
            MainHeaderUI(),
            MainMenuUI(),
          ],
        ));
  }

  // Future<void> _initAdMob() {
  //   return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  // }
}
