
import 'package:flame/components/parallax_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/route/LostPage/LostPage.dart';
import 'package:space_survival/route/MainPage/MainPage.dart';
import 'package:space_survival/route/SplashScreen/SplashScreenGame.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';

void main(){
  runApp(SpaceSurvivalApp());
}


class SpaceSurvivalApp extends StatelessWidget {
  const SpaceSurvivalApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:'/${Routes.main_page}',
      routes:{
        '/': (context) => SplashScreenGame(),
        '/${Routes.main_page}':(context) => MainPage(),
        '/${Routes.main_game}':(context) => MainGame(),
        '/${Routes.lost_page}':(context) => LostPage(),
      }
    );
  }
}


class MainGame extends StatefulWidget {
  MainGame({Key key}) : super(key: key);

  @override
  _MainGameState createState() => _MainGameState();
}

class _MainGameState extends State<MainGame> {
  @override
  Widget build(BuildContext context) {

    initialize();

    MyGame game = MyGame(context);


    return Container(
       child: game.widget,
    );
  }

  void initialize() async{
  
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
    'vehicle/spaceship/withShield/ship1shield1.png',
    'vehicle/spaceship/withShield/ship1shield2.png',
    'vehicle/spaceship/withShield/ship1shield3.png',
    'vehicle/spaceship/withShield/ship1shield4.png',
    'vehicle/vertex/vertex_1.png',
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
  ]);

  Flame.audio.disableLog();
  Flame.audio.loadAll(<String>[
    'sfx/comet_destroy.ogg',
  ]);
  
  }

  @override
  void dispose() {
    SpaceSurvivalGame.game = null;
    super.dispose();
  }
}

class MyGame extends BaseGame{

  MyGame(BuildContext context){
  
    final images = [

      ParallaxImage("background/bg_base.png",repeat: ImageRepeat.repeat,fill: LayerFill.height),
      ParallaxImage("background/bg_big_star.png",repeat: ImageRepeat.repeat,fill: LayerFill.height),
      ParallaxImage("background/bg_planet.png",repeat: ImageRepeat.repeat,fill: LayerFill.none),

    ];
  SpaceSurvivalGame.context = context;
  SpaceSurvivalGame.game = SpaceSurvivalGame(images,VehicleFeatures.spaceship/*,Stage.stage_1*/);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = onTapDown;
  Flame.util.addGestureRecognizer(tapper);

  add(SpaceSurvivalGame.game);

  }

  void onTapDown(TapDownDetails tap){
    if(SpaceSurvivalGame.game != null){
      SpaceSurvivalGame.game.onTapDown(tap);
    }
    
  }
}