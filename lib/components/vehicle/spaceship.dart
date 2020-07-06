
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Spaceship extends Vehicle{


  Spaceship(SpaceSurvivalGame game,VehicleBehaviour vehicleBehaviour,VehicleAttribute vehicleAttribute,VehicleSprite vehicleSprite) 
            : super(game,vehicleBehaviour,vehicleAttribute){
    

    vehicleRect = Rect.fromLTWH(vehicleBehaviour.setXRandomPosition,vehicleBehaviour.setYRandomPosition,vehicleAttribute.widthComponent,vehicleAttribute.heightComponent);

    vehicleInitSprites = List<Sprite>();
    vehicleInitSprites = vehicleSprite.vehicleSprites;


    vehicleInitShieldSprites = List<Sprite>();
    vehicleInitShieldSprites = vehicleSprite.vehicleShieldSprite;

    vehicleInitGotHitSprites = List<Sprite>();
    vehicleInitGotHitSprites = vehicleSprite.vehicleGotHitSprite;
  }  

}