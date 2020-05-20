

import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class CollusionWeaponAndComet{

  final SpaceSurvivalGame game;

  CollusionWeaponAndComet(this.game);

  void update(double t){

      collisionOccurred(t);



  }


  //if any comet meet any weapon both component will destroy
  void collisionOccurred(double t){

    List<Comet> comets = game.comets;
    List<Weapon> weapons = game.weapons;

    for(Comet comet in comets){
      for(var weapon in weapons){
        double cx = comet.cometRect.left;
        double cy = comet.cometRect.top;
        Offset colComet = Offset(cx,cy);

        double wx = weapon.weaponRect.left;
        double wy = weapon.weaponRect.top;
        Offset colWeapon = Offset(wx,wy);


        if(colWeapon.dx < colComet.dx + comet.widthComponent/2.5 &&
        colWeapon.dx + weapon.widthComponent/2.5 > colComet.dx &&
        colWeapon.dy < colComet.dy + comet.widthComponent/2.5 &&
        colWeapon.dy + weapon.heightComponent/2.5 > colComet.dy){
          //collision detected;
          Flame.audio.play('sfx/comet_destroy.ogg');
          comet.hitPoint -=1;
          game.score+=1; //score
          
          weapon.isDestroy = true;
          weapon.isOffScreen = true;


        }
      }
    }
  }

}