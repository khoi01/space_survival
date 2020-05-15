import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Weapon {
  Rect weaponRect;

  final SpaceSurvivalGame game;
  final double widthComponent;
  final double heightComponent;
  final String targetComet; //weapon wll destroy witch component

  List<Sprite> weaponSprite;
  Offset targetLocation;  //move the weapon cordinates to comet cordiates 
  bool isDestroy = false;
  bool isOffScreen = false;

  // static int maxUsedInterval = 1500;
  // static int minUsedInterval = 1500;
  // static int intervalChange = 3;
  // static int currentInterval;
  // static int nextUsedInterval;
  
  Weapon(
    this.game,
    this.targetComet,
    this.widthComponent,
    this.heightComponent,
  );

  double get speed => game.tileSize * 3;


  void render(Canvas canvas){
      if(!isDestroy){
        int randomSprite = game.random.nextInt(weaponSprite.length);
        weaponSprite[randomSprite].renderRect(canvas,weaponRect.inflate(2));
      }
  } 


  void update(double t){

        //if weapon go off screen
         if(weaponRect.top > game.screenSize.height){
            isOffScreen = true;
            isDestroy = true;
          }
      if(!isDestroy){
        
        //get comet that need to destroy by cometId
        Comet comet = game.comets.firstWhere((targetComet) => targetComet.cometId == this.targetComet, orElse: () => null);
        if(comet != null){
          targetLocation = Offset(comet.cometRect.left,comet.cometRect.top);

          double stepDistance = speed * t;

          Offset toTarget = targetLocation /*cordinate comet to destroy*/  - Offset(this.weaponRect.left,this.weaponRect.top); // current weapon position


          if(stepDistance < toTarget.distance){
            Offset stepToTarget = Offset.fromDirection(toTarget.direction,stepDistance);
            weaponRect = weaponRect.shift(stepToTarget);
          }else{
            isDestroy = true;
            isOffScreen = true;
            comet.hitPoint -=1;

      
          }
        }else{
          isDestroy = true;
          isOffScreen = true;
        }

      }
  }



}
