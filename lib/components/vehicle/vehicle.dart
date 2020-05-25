import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Vehicle{

  Rect vehicleRect;
  final SpaceSurvivalGame game;
  final VehicleBehaviour vehicleBehaviour;
  final VehicleAttribute vehicleAttribute;

  List<Weapon> weapons;
  List<Sprite> vehicleInitSprites;
  List<Sprite> vehicleInitShieldSprites;

  bool isUsingShield = false;
  bool isDestroy = false;
  Offset targetLocation;
  
  
  // min/max that vehicle position able to reach/go
  double minXPosition;
  double minYPosition;

   int currentIntervalReload;
   int nextUsedReload;

   int shieldStop; //when shield will stop
  
  Vehicle(this.game,this.vehicleBehaviour,this.vehicleAttribute){
    weapons = List<Weapon>();
    setNewCordinates();
    currentIntervalReload = vehicleAttribute.maxUsedInterval;
    nextUsedReload = DateTime.now().millisecondsSinceEpoch + currentIntervalReload;

  }

  void render(Canvas canvas){

    weapons.forEach((weapon) {
      weapon.render(canvas);
    });

    if(!isDestroy && !isUsingShield){
      int randomSprite = game.random.nextInt(vehicleInitSprites.length);
      vehicleInitSprites[randomSprite].renderRect(canvas,vehicleRect.inflate(2));
    }else if(!isDestroy && isUsingShield){
      int randomSprite = game.random.nextInt(vehicleInitShieldSprites.length);
      vehicleInitShieldSprites[randomSprite].renderRect(canvas,vehicleRect.inflate(2)); 
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

    if(isUsingShield){
        if(Time.getCurrentTime() >= shieldStop ){
          isUsingShield = false;
        }
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

    if(nowTimestamp >= nextUsedReload){

      if(currentIntervalReload > this.vehicleAttribute.minUsedInterval){
        currentIntervalReload -= this.vehicleAttribute.intervalChange;
        currentIntervalReload -= (currentIntervalReload * .02).toInt();
      }

      nextUsedReload = nowTimestamp + currentIntervalReload;
      isAbleLaunchWeapon = true;
    }

      return isAbleLaunchWeapon;
  }

  void onTapDown(){

      if(isAbleUseShield()){
        usingShield();
      }
    
  }
  
  void usingShield(){
  
    //get current time
    int nowTimeStamp = Time.getCurrentTime();
    shieldStop = nowTimeStamp + vehicleAttribute.shieldDuration;
    isUsingShield = true;
    vehicleAttribute.currentShield-=1;
  }

  bool isAbleUseShield(){
    if(vehicleAttribute.currentShield > 0){
      return true;
    }else{
      return false;
    }
  }
}