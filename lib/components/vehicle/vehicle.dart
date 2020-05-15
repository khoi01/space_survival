import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';

class Vehicle{

  Rect vehicleRect;
  final SpaceSurvivalGame game;
  final VehicleBehaviour vehicleBehaviour;
  final VehicleAttribute vehicleAttribute;

  List<Weapon> weapons;
  List<Sprite> vehicleSprite;
  
  bool isDestroy = false;
  Offset targetLocation;
  
  
  // min/max that vehicle position able to reach/go
  double minXPosition;
  double minYPosition;

   int currentInterval;
   int nextUsed;
  
  Vehicle(this.game,this.vehicleBehaviour,this.vehicleAttribute){
    weapons = List<Weapon>();
    setNewCordinates();
    currentInterval = vehicleAttribute.maxUsedInterval;
    nextUsed = DateTime.now().millisecondsSinceEpoch + currentInterval;

  }

  void render(Canvas canvas){

    weapons.forEach((weapon) {
      weapon.render(canvas);
    });

    if(!isDestroy){
    int randomSprite = game.random.nextInt(vehicleSprite.length);
    vehicleSprite[randomSprite].renderRect(canvas,vehicleRect.inflate(2));

    }
  }

  void update(double t){

    weapons.forEach((weapon) {
      weapon.update(t);
    });

    weapons.removeWhere((weapon) => weapon.isOffScreen);

    if(!isDestroy && vehicleBehaviour.vehicleBehaviourType != VehicleBehaviourType.testing){
        double stepDistance = this.vehicleAttribute.speed * t;
        Offset toTarget = targetLocation - Offset(vehicleRect.left,vehicleRect.top);
        if(stepDistance < toTarget.distance){
          Offset stepToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
          vehicleRect = vehicleRect.shift(stepToTarget);
        }else{
          vehicleRect = vehicleRect.shift(toTarget);
          setNewCordinates();
        }
    }else{

    }
  }

  void setNewCordinates(){
    VehicleCordinate  newCordinate= VehicleBehaviour.getNewLocattion(this.game,vehicleBehaviour.vehicleBehaviourType,this.vehicleAttribute.widthComponent,this.vehicleAttribute.heightComponent);
    targetLocation = Offset(newCordinate.newXPosition,newCordinate.newYPosition);
  }

   bool isAbleToLaunchWeapon(){
      bool isAbleLaunchWeapon = false;

    //get current time
    int nowTimestamp = Time.getCurrentTime();

    if(nowTimestamp >= nextUsed){

      if(currentInterval > this.vehicleAttribute.minUsedInterval){
        currentInterval -= this.vehicleAttribute.intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }

      nextUsed = nowTimestamp + currentInterval;
      isAbleLaunchWeapon = true;
    }

      return isAbleLaunchWeapon;
  }
}