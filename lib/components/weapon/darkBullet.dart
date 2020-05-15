import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class DarkBullet extends Weapon{
  
  DarkBullet(SpaceSurvivalGame game,String  targetComet,double x,double y, double widthComponent, double heightComponent) : super(game,targetComet, widthComponent, heightComponent){
    weaponRect = Rect.fromLTWH(x, y, widthComponent,heightComponent);

    weaponSprite = List<Sprite>();

    weaponSprite.add(Sprite("weapon/dark/dark_1.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_2.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_3.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_4.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_5.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_6.png"));
    weaponSprite.add(Sprite("weapon/dark/dark_7.png"));


    
    
  }

}