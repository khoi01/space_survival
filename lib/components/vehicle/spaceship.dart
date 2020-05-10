
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/logic/vehicleLevel.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';

class Spaceship extends Vehicle{


  Spaceship(SpaceSurvivalGame game,Level level,VehicleLevel vehicleLevel,double weightComponent,double heightComponent) : super(game,level,vehicleLevel,weightComponent,heightComponent){
    

    vehicleRect = Rect.fromLTWH(vehicleLevel.setXRandomPosition,vehicleLevel.setYRandomPosition, weightComponent,heightComponent);

    vehicleSprite = List<Sprite>();
    vehicleSprite.add(Sprite('spaceships/ship_1.png'));
    vehicleSprite.add(Sprite('spaceships/ship_2.png'));
    vehicleSprite.add(Sprite('spaceships/ship_3.png'));
    vehicleSprite.add(Sprite('spaceships/ship_4.png'));  
  
  }

}