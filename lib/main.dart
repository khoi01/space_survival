import 'package:flame/components/parallax_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/route/CreditPage/CreditPage.dart';
import 'package:space_survival/route/Garage/GaragePage.dart';
import 'package:space_survival/route/LostPage/LostPage.dart';
import 'package:space_survival/route/MainPage/MainPage.dart';
import 'package:space_survival/route/RewardAdPage/RewardAdPage.dart';
import 'package:space_survival/route/Scoreboard/ScoreboardPage.dart';
import 'package:space_survival/route/SelectStagePage/SelectStagePage.dart';
import 'package:space_survival/route/SelectVehiclePage/SelectVehiclePage.dart';
import 'package:space_survival/route/SplashScreen/SplashScreenGame.dart';
import 'package:space_survival/route/Store/StorePage.dart';
import 'package:space_survival/route/Tutorial/TutorialPage.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

void main() {
  runApp(SpaceSurvivalApp());
}

class SpaceSurvivalApp extends StatelessWidget {
  const SpaceSurvivalApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/${Routes.main_page}', routes: {
      '/': (context) => SplashScreenGame(),
      '/${Routes.main_page}': (context) => MainPage(),
      '/${Routes.main_game}': (context) => MainGame(),
      '/${Routes.lost_page}': (context) => LostPage(),
      '/${Routes.credits_page}': (context) => CreditsPage(),
      '/${Routes.store_page}': (context) => StorePage(),
      '/${Routes.garage_page}': (context) => GaragePage(),
      '/${Routes.scoreboard_page}': (context) => ScoreboardPage(),
      '/${Routes.tutorial_page}': (context) => TutorialPage(),
      '/${Routes.select_vehicle_page}': (context) => SelectVehiclePage(),
      '/${Routes.select_stage_page}': (context) => SelectStagePage(),
      '/${Routes.reward_ad_page}': (context) => RewardAdPage(),
    });
  }
}

class MainGame extends StatefulWidget {
  final VehicleFeatures selectedVehicle;
  MainGame({Key key, this.selectedVehicle}) : super(key: key);

  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    initialize();

    MyGame game = MyGame(context, widget.selectedVehicle);

    return WillPopScope(
      onWillPop: () {
        MusicConfiq.stopBgm();
        return Future.value(
            true); //able to go to previous route,but need to stop the music
      },
      child: Container(
        child: game.widget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // MusicConfiq.stopBgmRoute();
  }

  void initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Flame.util.fullScreen();
    await Flame.util.setOrientation(DeviceOrientation.portraitUp);

    Flame.images.loadAll(<String>[
      'background/bg_base.png',
      'background/bg_big_star.png',
      'background/bg_planet.png',
      'background/bg1.png',
      'vehicle/spaceship/ship_1.png',
      'vehicle/spaceship/ship_2.png',
      'vehicle/spaceship/ship_3.png',
      'vehicle/spaceship/ship_4.png',
      'vehicle/spaceship/gif/ship_5.gif',
      'vehicle/spaceship/withShield/ship1shield1.png',
      'vehicle/spaceship/withShield/ship1shield2.png',
      'vehicle/spaceship/withShield/ship1shield3.png',
      'vehicle/spaceship/withShield/ship1shield4.png',
      'vehicle/spaceship/gotHit/ship1GotHit1.png',
      'vehicle/spaceship/gotHit/ship1GotHit2.png',
      'vehicle/spaceship/gotHit/ship1GotHit3.png',
      'vehicle/spaceship/gotHit/ship1GotHit4.png',
      'vehicle/spaceship/gotHit/ship1GotHit5.png',
      'vehicle/spaceship/gotHit/ship1GotHit6.png',
      'vehicle/vertex/vertex1.png',
      'vehicle/vertex/vertex2.png',
      'vehicle/vertex/vertex3.png',
      'vehicle/vertex/vertex4.png',
      'vehicle/vertex/vertex5.png',
      'vehicle/vertex/gotHit/vertexGotHit1.png',
      'vehicle/vertex/gotHit/vertexGotHit2.png',
      'vehicle/vertex/gotHit/vertexGotHit3.png',
      'vehicle/vertex/gotHit/vertexGotHit4.png',
      'vehicle/vertex/gotHit/vertexGotHit5.png',
      'vehicle/vertex/gotHit/vertexGotHit6.png',
      'vehicle/vertex/withShield/vertexWithShield1.png',
      'vehicle/vertex/withShield/vertexWithShield2.png',
      'vehicle/vertex/withShield/vertexWithShield3.png',
      'vehicle/x-19/x-19_1.png',
      'vehicle/x-19/x-19_2.png',
      'vehicle/x-19/x-19_3.png',
      'vehicle/x-19/x-19_4.png',
      'vehicle/x-19/x-19_5.png',
      'vehicle/x-19/x-19_6.png',
      'vehicle/x-19/x-19_7.png',
      'vehicle/x-19/withShield/x-19WithShield1.png',
      'vehicle/x-19/withShield/x-19WithShield2.png',
      'vehicle/x-19/withShield/x-19WithShield3.png',
      'vehicle/x-19/withShield/x-19WithShield4.png',
      'vehicle/x-19/gotHit/x-19GotHit1.png',
      'vehicle/x-19/gotHit/x-19GotHit2.png',
      'vehicle/x-19/gotHit/x-19GotHit3.png',
      'vehicle/x-19/gotHit/x-19GotHit4.png',
      'vehicle/x-19/gif/x-19Gif.gif',
      'comet/rock/comet_1.png',
      'comet/rock/comet_2.png',
      'comet/rock/comet_3.png',
      'comet/rock/comet_4.png',
      'comet/rock/comet_5.png',
      'comet/rock/comet_6.png',
      'comet/rock/lock/comet_lock_1.png',
      'comet/rock/lock/comet_lock_2.png',
      'comet/rock/lock/comet_lock_3.png',
      'comet/rock/lock/comet_lock_4.png',
      'comet/rock/lock/comet_lock_5.png',
      'comet/rock/lock/comet_lock_6.png',
      'weapon/electric/electric_1.png',
      'weapon/electric/electric_2.png',
      'weapon/electric/electric_3.png',
      'weapon/electric/electric_4.png',
      'weapon/electric/electric_5.png',
      'weapon/electric/electric_6.png',
      'weapon/electric/electric_7.png',
      'weapon/electric/electric_8.png',
      'weapon/electric/electric_9.png',
      'weapon/electric/electric_10.png',
      'weapon/electric/electric_11.png',
      'weapon/dark/dark_1.png',
      'weapon/dark/dark_2.png',
      'weapon/dark/dark_3.png',
      'weapon/dark/dark_4.png',
      'weapon/dark/dark_5.png',
      'weapon/dark/dark_6.png',
      'weapon/dark/dark_7.png',
      'weapon/reload/reload_weapon_ready.png',
      'weapon/reload/reload_weapon_waiting.png',
      'shield/shield_1.png',
      'heart/heart.png',
    ]);

    Flame.audio.disableLog();
    Flame.audio.loadAll(<String>[
      'sfx/comet_destroy.ogg',
      'bgm/bgm.mp3',
      'bgm/bgm_route.mp3',
      'sfx/spaceship/sound_enable_shield.mp3',
      'sfx/spaceship/sound_reload.mp3'
    ]);
  }

  @override
  void dispose() {
    SpaceSurvivalGame.game = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      MusicConfiq.stopBgm();
    } else if (state == AppLifecycleState.resumed) {
      MusicConfiq.startBgm();
    }
  }
}

class MyGame extends BaseGame {
  MyGame(BuildContext context, VehicleFeatures selectedVehicle) {
    final images = [
      ParallaxImage("background/bg_base.png",
          repeat: ImageRepeat.repeat, fill: LayerFill.height),
      ParallaxImage("background/bg_big_star.png",
          repeat: ImageRepeat.repeat, fill: LayerFill.height),
      ParallaxImage("background/bg_planet.png",
          repeat: ImageRepeat.repeat, fill: LayerFill.none),
    ];
    SpaceSurvivalGame.context = context;
    SpaceSurvivalGame.game =
        SpaceSurvivalGame(images, selectedVehicle, Stage.stage_1);

    TapGestureRecognizer tapper = TapGestureRecognizer();
    tapper.onTapDown = onTapDown;
    Flame.util.addGestureRecognizer(tapper);

    add(SpaceSurvivalGame.game);
  }

  void onTapDown(TapDownDetails tap) {
    if (SpaceSurvivalGame.game != null) {
      SpaceSurvivalGame.game.onTapDown(tap);
    }
  }
}
