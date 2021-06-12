import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class ElectricBullet extends Weapon {
  ElectricBullet(SpaceSurvivalGame game, String targetComet, double x, double y,
      double widthComponent, double heightComponent)
      : super(game, targetComet, widthComponent, heightComponent) {
    weaponRect = Rect.fromLTWH(x, y, widthComponent, heightComponent);

    //weaponSprite = List<Sprite>(); (Deprecated)
    weaponSprite = [];

    weaponSprite.add(Sprite("weapon/electric/electric_1.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_2.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_3.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_4.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_5.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_6.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_7.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_8.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_9.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_10.png"));
    weaponSprite.add(Sprite("weapon/electric/electric_11.png"));
  }
}
