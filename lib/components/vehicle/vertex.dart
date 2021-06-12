import 'dart:ui';

import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/darkBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Vertex extends Vehicle {
  Vertex(SpaceSurvivalGame game, VehicleBehaviour vehicleBehaviour,
      VehicleAttribute vehicleAttribute, VehicleSprite vehicleSprite)
      : super(game, vehicleBehaviour, vehicleAttribute) {
    vehicleRect = Rect.fromLTWH(
        vehicleBehaviour.setXRandomPosition,
        vehicleBehaviour.setYRandomPosition,
        vehicleAttribute.widthComponent,
        vehicleAttribute.heightComponent);

    //vehicleInitSprites = List<Sprite>();(Deprecated)
    vehicleInitSprites = [];

    vehicleInitSprites = vehicleSprite.vehicleSprites;

    //vehicleInitShieldSprites = List<Sprite>(); (Deprecated)
    vehicleInitShieldSprites = [];
    vehicleInitShieldSprites = vehicleSprite.vehicleShieldSprite;

    //vehicleInitGotHitSprites = List<Sprite>(); (Deprecated)
    vehicleInitGotHitSprites = [];
    vehicleInitGotHitSprites = vehicleSprite.vehicleGotHitSprite;
  }

  @override
  Weapon triggerWeapon(String targetComet) {
    DarkBullet bullet = new DarkBullet(game, targetComet, this.vehicleRect.left,
        this.vehicleRect.top, game.tileSize * 1, game.tileSize * 1);
    return bullet;
  }
}
