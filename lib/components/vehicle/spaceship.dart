import 'dart:ui';

import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Spaceship extends Vehicle {
  Spaceship(SpaceSurvivalGame game, VehicleBehaviour vehicleBehaviour,
      VehicleAttribute vehicleAttribute, VehicleSprite vehicleSprite)
      : super(game, vehicleBehaviour, vehicleAttribute) {
    vehicleRect = Rect.fromLTWH(
        vehicleBehaviour.setXRandomPosition,
        vehicleBehaviour.setYRandomPosition,
        vehicleAttribute.widthComponent,
        vehicleAttribute.heightComponent);

    // vehicleInitSprites = List<Sprite>(); (Deprecated)
    vehicleInitSprites = [];

    vehicleInitSprites = vehicleSprite.vehicleSprites;

    // vehicleInitShieldSprites = List<Sprite>(); (Deprecated)

    vehicleInitShieldSprites = [];
    vehicleInitShieldSprites = vehicleSprite.vehicleShieldSprite;

    //vehicleInitGotHitSprites = List<Sprite>(); (Deprecated)

    vehicleInitGotHitSprites = [];
    vehicleInitGotHitSprites = vehicleSprite.vehicleGotHitSprite;
  }
}
