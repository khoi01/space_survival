
import 'package:flame/flame.dart';
import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(<String>[
    'background/bg.png',
    'spaceships/ship_1.png',
    'spaceships/ship_2.png',
    'spaceships/ship_3.png',
    'spaceships/ship_4.png',
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
  ]);


  SpaceSurvivalGame game = SpaceSurvivalGame();
  runApp(game.widget);

  
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}