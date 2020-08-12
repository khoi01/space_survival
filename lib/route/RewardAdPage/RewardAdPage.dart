import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/adMob/ad_manager.dart';

class RewardAdPage extends StatefulWidget {
  RewardAdPage({Key key}) : super(key: key);

  @override
  _RewardAdPageState createState() => _RewardAdPageState();
}

class _RewardAdPageState extends State<RewardAdPage> {
  @override
  void initState() {
    super.initState();
    RewardedVideoAd.instance.listener = _onRewardedAdEvent;
    if (AdManager.isRewardedAdReady) {
      showAds();
    }
  }

  Future<void> showAds() async {
    try {
      await RewardedVideoAd.instance.show();
    } on PlatformException catch (e) {
      CustomWidget.showToasted("reward not ready.please try again", false);
      Nav.route(context, Routes.main_page, null,
          isRemovePreviousBackStack: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: Container(),
    );
  }

  void _onRewardedAdEvent(RewardedVideoAdEvent event,
      {String rewardType, int rewardAmount}) {
    switch (event) {
      case RewardedVideoAdEvent.loaded:
        setState(() {
          AdManager.isRewardedAdReady = true;
        });
        break;
      case RewardedVideoAdEvent.closed:
        setState(() {
          AdManager.isRewardedAdReady = false;
        });
        Nav.route(context, Routes.main_page, null,
            isRemovePreviousBackStack: true);
        break;
      case RewardedVideoAdEvent.failedToLoad:
        setState(() {
          AdManager.isRewardedAdReady = false;
        });
        print('Failed to load a rewarded ad');
        break;
      case RewardedVideoAdEvent.rewarded:
        AdManager.giveReward();

        Nav.route(context, Routes.main_page, null,
            isRemovePreviousBackStack: true);

        break;
      default:
        Nav.route(context, Routes.main_page, null,
            isRemovePreviousBackStack: true);
    }
  }

  @override
  void dispose() {
    RewardedVideoAd.instance.listener = null;
    super.dispose();
  }
}
