import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class ReloadWeapon {

  Rect reloadRect;
  final SpaceSurvivalGame game;
  final double setXPosition;
  final double setYPosition;
  final double widthComponent;
  final double heightComponent;

  Sprite reloadReadySprite;
  Sprite reloadWaitingSprite;
  bool isReady = false;

  ReloadWeapon(this.game, this.setXPosition, this.setYPosition, this.widthComponent, this.heightComponent){
    
    reloadRect = Rect.fromLTWH(setXPosition,setYPosition,widthComponent,heightComponent);
    reloadReadySprite = Sprite('weapon/reload/reload_weapon_ready.png');
    reloadWaitingSprite = Sprite('weapon/reload/reload_weapon_waiting.png');
  }


  void render(Canvas canvas){

  }

  void update(double t){
    
  }
}
