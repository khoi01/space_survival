import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Vertex extends Vehicle{
  Vertex(SpaceSurvivalGame game, VehicleBehaviour vehicleBehaviour, VehicleAttribute vehicleAttribute) 
  : super(game, vehicleBehaviour, vehicleAttribute){

        vehicleRect = Rect.fromLTWH(vehicleBehaviour.setXRandomPosition,vehicleBehaviour.setYRandomPosition,vehicleAttribute.widthComponent,vehicleAttribute.heightComponent);

    vehicleSprite = List<Sprite>();
    vehicleSprite.add(Sprite('vehicle/vertex/vertex_1.png'));
  }

}