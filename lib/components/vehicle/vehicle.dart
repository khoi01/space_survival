import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleLevel.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';

class Vehicle{
  Rect vehicleRect;
  final SpaceSurvivalGame game;
  final VehicleLevel vehicleLevel;
  final Level level;
  final double weightComponent;
  final double heightComponent;
  List<Weapon> weapons;
  List<Sprite> vehicleSprite;
  int hitPoint = 3;
  
  
  bool isDestroy = false;
  Offset targetLocation;
  
  
  // min/max that vehicle position able to reach/go
  double minXPosition;
  double minYPosition;
  
  static int maxUsedInterval = 3000;
  static int minUsedInterval = 3000;
  static int intervalChange = 3;
  static int currentInterval;
  static int nextUsed;

  double get speed => game.tileSize * 0.5;
    
  
  Vehicle(this.game,this.level,this.vehicleLevel,this.weightComponent,this.heightComponent){
    weapons = List<Weapon>();
    setNewCordinates();
    currentInterval = maxUsedInterval;
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

    if(!isDestroy && level != Level.test_collision_comet_and_spaceships){
        double stepDistance = speed * t;
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
    VehicleCordinate  newCordinate= VehicleLevel.getNewLocattion(this.game,this.level,this.weightComponent,this.heightComponent);
    targetLocation = Offset(newCordinate.newXPosition,newCordinate.newYPosition);
  }

  static bool isAbleToLaunchWeapon(){
      bool isAbleLaunchWeapon = false;

    //get current time
    int nowTimestamp = Time.getCurrentTime();

    if(nowTimestamp >= nextUsed){

      if(currentInterval > minUsedInterval){
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }

      nextUsed = nowTimestamp + currentInterval;
      isAbleLaunchWeapon = true;
    }

      return isAbleLaunchWeapon;
  }
}