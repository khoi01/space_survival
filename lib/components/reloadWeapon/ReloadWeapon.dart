import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class ReloadWeapon {

  Rect reloadRect;
  final SpaceSurvivalGame game;
  final double setXPosition;
  final double setYPosition;
  final double widthComponent;
  final double heightComponent;

  Sprite reloadReadySprite;
  Sprite reloadSprite_100;
  Sprite reloadSprite_75;
  Sprite reloadSprite_50;
  Sprite reloadSprite_25;
  Sprite reloadSprite_0;
  bool isReady = false;
  int reloadPercentage;

  Vehicle vehicle;

  ReloadWeapon(this.game,this.vehicle,this.setXPosition, this.setYPosition, this.widthComponent, this.heightComponent,){
    
    reloadRect = Rect.fromLTWH(setXPosition,setYPosition,widthComponent,heightComponent);

    reloadSprite_100 = Sprite('weapon/reload/reload_weapon_5.png');
    reloadSprite_75 = Sprite('weapon/reload/reload_weapon_4.png');
    reloadSprite_50 = Sprite('weapon/reload/reload_weapon_3.png');
    reloadSprite_25 = Sprite('weapon/reload/reload_weapon_2.png');
    reloadSprite_0 = Sprite('weapon/reload/reload_weapon_1.png');
    
  }


  void render(Canvas canvas){
    

    if(reloadPercentage <= 100 && reloadPercentage > 75){
        reloadSprite_100.renderRect(canvas,reloadRect.inflate(2));
    }else if(reloadPercentage <= 75 && reloadPercentage > 50){
      reloadSprite_75.renderRect(canvas,reloadRect.inflate(2));
    }else if(reloadPercentage <= 50 && reloadPercentage > 25){
      reloadSprite_50.renderRect(canvas, reloadRect.inflate(2));
    }else if(reloadPercentage <= 25 && reloadPercentage > 0){
      reloadSprite_25.renderRect(canvas,reloadRect.inflate(2));
    }else if(reloadPercentage <= 0 ){
      reloadSprite_0.renderRect(canvas,reloadRect.inflate(2));
    }
    
  }

  void update(double t){
    reloadPercentage = ((vehicle.nextUsedReload - Time.getCurrentTime()) / vehicle.vehicleAttribute.maxUsedInterval * 100).toInt();
  }
}
