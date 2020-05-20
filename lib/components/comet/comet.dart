import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:space_survival/logic/cometLevel.dart';

import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';

class Comet {
  Rect cometRect;
  final SpaceSurvivalGame game;
  final String cometId;
  final Level level;
  final CometLevel cometLevel;
  final double widthComponent;
  final double heightComponent;
  List<Sprite> cometSprite;
  List<Sprite> cometLockSprite;
  Offset targetLocation;
  bool isDestroy = false;
  bool isOffScreen = false;
  bool isLock = false; //check if comet get lock with any weapon;
  int hitPoint = 1;
  
  double get speed => game.tileSize * 1.8;
  

  

  Comet(
    this.game,
    this.cometId,
    this.level,
    this.cometLevel,
    this.widthComponent,
    this.heightComponent,
  );

  void render(Canvas canvas){
      if(!isDestroy){

        if(!isLock){
        int randomSprite = game.random.nextInt(cometSprite.length);
        cometSprite[randomSprite].renderRect(canvas,cometRect.inflate(2));
        }else{
          int randomSprite = game.random.nextInt(cometLockSprite.length);
          cometLockSprite[randomSprite].renderRect(canvas,cometRect.inflate(2));
        }

      }
  }

  void update(double t){

    if(hitPoint<=0){
      isDestroy = true;
      isOffScreen = true;
    }

    if(!isDestroy){
      
      if(isCollisionOccurred(t)){
        if(!game.vehicle.isUsingShield){
          game.vehicle.vehicleAttribute.currentHitPoint -=1;
        }else{
          //using shield and collusion between vehicle and comet - get a score
          game.score+=1; 
        }
          isDestroy = true;
          isOffScreen = true;
        
        
       
      }else{
        moveComet(t);
      }

    }

  }

  void moveComet(double t){

      targetLocation = Offset(this.cometLevel.setXFinalPosition,this.cometLevel.setYFinalPosition);

      double stepDistance = speed * t;
      Offset toTarget = targetLocation /*destination to go */ - Offset(cometRect.left,cometRect.top); // current position

      if(stepDistance < toTarget.distance - game.tileSize * 1.25 ){
        Offset stepToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
        cometRect = cometRect.shift(stepToTarget);
      }else{
        isDestroy = true;
        isOffScreen = true;
      }
  }

  bool isCollisionOccurred(double t){
    bool isHappen = false;
    Offset comet = Offset(cometRect.left,cometRect.top); //rect 1
    Offset spaceShip = Offset(game.vehicle.vehicleRect.left,game.vehicle.vehicleRect.top); //rect 2

if (comet.dx < spaceShip.dx + game.vehicle.vehicleAttribute.widthComponent/1.8 &&
  comet.dx + this.widthComponent/2 > spaceShip.dx &&
   comet.dy < spaceShip.dy + game.vehicle.vehicleAttribute.heightComponent/1.8 &&
   comet.dy + this.heightComponent/2 > spaceShip.dy) {
    // collision detected!
    isHappen = true;
}



    return isHappen;
  }


  void onTapDown(){
      this.isLock = true;
      game.launchWeapon(this.cometId);
  }



}
