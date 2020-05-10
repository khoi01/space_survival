import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class Space{
  final SpaceSurvivalGame game;
  Sprite bgSprite;
  Rect bgRect;

  Space(this.game){
    bgSprite = Sprite('background/bg1.png');
    bgRect = Rect.fromLTWH(
      0,game.screenSize.height - (game.tileSize * 23),
      game.tileSize * 9, // 9 == tile size
      game.tileSize * 23); // 23 ==  image height size /  120 per tile size
  }


  void render(Canvas canvas){
    bgSprite.renderRect(canvas,bgRect);
  }

  void update(double t){

  }
  
}