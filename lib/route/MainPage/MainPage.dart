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

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    MusicConfig.startBgmRoute();
    setState(() {
      _initAdMob().then((value) {
        AdManager.loadRewardedAd();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      MusicConfig.stopBgmRoute();
    } else if (state == AppLifecycleState.resumed) {
      MusicConfig.startBgmRoute();
      setState(() {
        _initAdMob().then((value) {
          AdManager.loadRewardedAd();
        });
      });
    } else {
      MusicConfig.stopBgmRoute();
    }
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

  Future<void> _initAdMob() async {
    return await FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }
}
