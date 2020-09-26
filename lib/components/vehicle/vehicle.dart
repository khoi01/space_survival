import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/electricBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Vehicle {
  Rect vehicleRect;
  final SpaceSurvivalGame game;
  final VehicleBehaviour vehicleBehaviour;
  final VehicleAttribute vehicleAttribute;

  List<Weapon> weapons;
  List<Sprite> vehicleInitSprites;
  List<Sprite> vehicleInitShieldSprites;
  List<Sprite> vehicleInitGotHitSprites;

  bool isUsingShield = false;
  bool isDestroy = false;
  bool isGotHit = false;
  Offset targetLocation;

  // min/max that vehicle position able to reach/go
  double minXPosition;
  double minYPosition;

  int currentIntervalReload;
  int nextUsedReload;

  int immuneStop; //when isGotHit will return back to false
  int shieldStop; //when shield will stop

  Vehicle(this.game, this.vehicleBehaviour, this.vehicleAttribute) {
    weapons = List<Weapon>();
    setNewCordinates();
    currentIntervalReload = vehicleAttribute.maxUsedInterval;
    nextUsedReload =
        DateTime.now().millisecondsSinceEpoch + currentIntervalReload;
  }

  void render(Canvas canvas) {
    weapons.forEach((weapon) {
      weapon.render(canvas);
    });

    if (isGotHit) {
      int randomSprite = game.random.nextInt(vehicleInitGotHitSprites.length);
      vehicleInitGotHitSprites[randomSprite]
          .renderRect(canvas, vehicleRect.inflate(2));
      return;
    }

    if (!isDestroy && !isUsingShield) {
      int randomSprite = game.random.nextInt(vehicleInitSprites.length);
      vehicleInitSprites[randomSprite]
          .renderRect(canvas, vehicleRect.inflate(2));
    } else if (!isDestroy && isUsingShield) {
      int randomSprite = game.random.nextInt(vehicleInitShieldSprites.length);
      vehicleInitShieldSprites[randomSprite]
          .renderRect(canvas, vehicleRect.inflate(2));
      Flame.audio.play('sfx/spaceship/sound_enable_shield.mp3', volume: .15);
    }
  }

  void update(double t) {
    weapons.forEach((weapon) {
      weapon.update(t);
    });

    weapons.removeWhere((weapon) => weapon.isOffScreen);

    if (!isDestroy &&
        vehicleBehaviour.vehicleBehaviourType != VehicleBehaviourType.testing) {
      double stepDistance = this.vehicleAttribute.speed * t;
      Offset toTarget =
          targetLocation - Offset(vehicleRect.left, vehicleRect.top);
      if (stepDistance < toTarget.distance) {
        Offset stepToTarget =
            Offset.fromDirection(toTarget.direction, stepDistance);
        vehicleRect = vehicleRect.shift(stepToTarget);
      } else {
        vehicleRect = vehicleRect.shift(toTarget);
        setNewCordinates();
      }
    } else {}

    if (isUsingShield) {
      if (Time.getCurrentTime() >= shieldStop) {
        isUsingShield = false;
      }
    }

    if (isGotHit) {
      if (Time.getCurrentTime() >= immuneStop) {
        isGotHit = false;
      }
    }
  }

  void setNewCordinates() {
    VehicleCordinate newCordinate = VehicleBehaviour.getNewLocattion(
        this.game,
        vehicleBehaviour.vehicleBehaviourType,
        this.vehicleAttribute.widthComponent,
        this.vehicleAttribute.heightComponent);
    targetLocation =
        Offset(newCordinate.newXPosition, newCordinate.newYPosition);
  }

  bool isAbleToLaunchWeapon() {
    bool isAbleLaunchWeapon = false;

    //get current time
    int nowTimestamp = Time.getCurrentTime();

    if (nowTimestamp >= nextUsedReload) {
      if (currentIntervalReload > this.vehicleAttribute.minUsedInterval) {
        currentIntervalReload -= this.vehicleAttribute.intervalChange;
        currentIntervalReload -= (currentIntervalReload * .02).toInt();
      }

      nextUsedReload = nowTimestamp + currentIntervalReload;
      isAbleLaunchWeapon = true;
    }

    return isAbleLaunchWeapon;
  }

  void onTapDown() {
    if (isAbleUseShield()) {
      usingShield();
    }
  }

  //this method will trigger if vehicle got hit by any comet/component
  void immuneDamage() {
    int nowTimeStamp = Time.getCurrentTime();

    //want to check if hitpoint not equal to 0 or lower then that
    if (vehicleAttribute.currentHitPoint > 0) {
      immuneStop = nowTimeStamp + vehicleAttribute.durationWhenGotHit;
      isGotHit = true;
    }
  }

  void usingShield() {
    //get current time
    int nowTimeStamp = Time.getCurrentTime();
    shieldStop = nowTimeStamp + vehicleAttribute.shieldDuration;
    isUsingShield = true;
    vehicleAttribute.currentShield -= 1;
  }

  bool isAbleUseShield() {
    if (vehicleAttribute.currentShield > 0) {
      return true;
    } else {
      return false;
    }
  }

  Weapon triggerWeapon(String targetComet) {
    ElectricBullet bullet = new ElectricBullet(
        game,
        targetComet,
        this.vehicleRect.left,
        this.vehicleRect.top,
        game.tileSize * 1.2,
        game.tileSize * 1.2);
    return bullet;
  }
}
