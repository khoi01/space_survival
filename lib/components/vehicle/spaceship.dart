
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Spaceship extends Vehicle{


  Spaceship(SpaceSurvivalGame game,VehicleBehaviour vehicleBehaviour,VehicleAttribute vehicleAttribute) 
            : super(game,vehicleBehaviour,vehicleAttribute){
    

    vehicleRect = Rect.fromLTWH(vehicleBehaviour.setXRandomPosition,vehicleBehaviour.setYRandomPosition,vehicleAttribute.widthComponent,vehicleAttribute.heightComponent);

    vehicleSprite = List<Sprite>();
    vehicleSprite.add(Sprite('vehicle/spaceship/ship_1.png'));
    vehicleSprite.add(Sprite('vehicle/spaceship/ship_2.png'));
    vehicleSprite.add(Sprite('vehicle/spaceship/ship_3.png'));
    vehicleSprite.add(Sprite('vehicle/spaceship/ship_4.png'));

    vehicleShieldSprite = List<Sprite>();
    vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield1.png'));
    vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield2.png'));
    vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield3.png'));
    vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield4.png'));
      
  }  

}