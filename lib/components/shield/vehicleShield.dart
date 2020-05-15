import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/shield/shield.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class VehicleShield extends Shield{
 
  VehicleShield(SpaceSurvivalGame game,double setXPosition,double setYPosition, double widthComponent, double heightComponent) : super(game){
    
    shieldRect = Rect.fromLTWH(setXPosition,setYPosition,widthComponent,heightComponent);

    shieldSprite = Sprite("shield/shield_1.png");

  }

}