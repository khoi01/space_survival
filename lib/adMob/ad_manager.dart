import 'dart:io';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/repository/CoinRepository.dart';

class AdManager {
  static bool isRewardedAdReady;

  static String get appId {
    if (Platform.isAndroid) {
      return AdMobAppID.appIdTesting;
    }
    if (Platform.isIOS) {
      return "<YOUR_IOS_ADMOB_APP_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return AdMobID.admobRewardedTesting;
    } else if (Platform.isIOS) {
      return "<YOUR_IOS_REWARDED_AD_UNIT_ID>";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static void giveReward() {
    int reward = Num.random(1, 2);
    CoinRepository.addCoin(reward.toDouble());
  }

  static bool isShowRewardAds() {
    int result = Num.random(1, 3);

    if (result == 1) {
      return true;
    } else {
      return false;
    }
  }

  static void loadRewardedAd() {
    RewardedVideoAd.instance.load(
      targetingInfo: MobileAdTargetingInfo(),
      adUnitId: AdManager.rewardedAdUnitId,
    );
  }
}
