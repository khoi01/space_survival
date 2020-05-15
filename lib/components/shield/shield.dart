


import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Shield{

  Rect shieldRect;
  final SpaceSurvivalGame game;
  Sprite shieldSprite;
  bool isOffScreen = false;
    Shield(this.game);


  void render(Canvas canvas){
      
      shieldSprite.renderRect(canvas,shieldRect.inflate(2));
  }


  void update(double t){

  }


  static int maxCapacityShield(){
    return 5;
  }
}