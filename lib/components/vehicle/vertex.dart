import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/darkBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Vertex extends Vehicle{
  Vertex(SpaceSurvivalGame game, VehicleBehaviour vehicleBehaviour, VehicleAttribute vehicleAttribute,VehicleSprite vehicleSprite) 
  : super(game, vehicleBehaviour, vehicleAttribute){

        vehicleRect = Rect.fromLTWH(vehicleBehaviour.setXRandomPosition,vehicleBehaviour.setYRandomPosition,vehicleAttribute.widthComponent,vehicleAttribute.heightComponent);

    vehicleInitSprites = List<Sprite>();
    vehicleInitSprites.add(Sprite('vehicle/vertex/vertex_1.png'));
  }


  @override
  Weapon triggerWeapon(String targetComet){
          DarkBullet bullet = new DarkBullet(game,
                                                targetComet,
                                                this.vehicleRect.left,
                                                this.vehicleRect.top,
                                                game.tileSize * 1.2,
                                                game.tileSize * 1.2
                                                );
    return bullet;
  } 

}