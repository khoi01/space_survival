import 'dart:ui';

import 'package:space_survival/spaceSurvivalGame.dart';

class VehicleHealthBar {
  final SpaceSurvivalGame game;
  Rect healthBarRect; //red bar
  Rect remainingHealthRect; //green bar
  VehicleHealthBar(
    this.game,){

      double barWidth = game.screenSize.width / 1.50;
   healthBarRect = Rect.fromLTWH(
      game.screenSize.width / 2 - barWidth / 2,
            game.screenSize.height * 0.03,
      barWidth,
      game.tileSize * 0.3,
    );
    remainingHealthRect = Rect.fromLTWH(
      game.screenSize.width / 2 - barWidth / 2,
            game.screenSize.height * 0.03,
      barWidth,
      game.tileSize * 0.3,
    );
    }

  void render(Canvas canvas){
    Paint healthBarColor = Paint()..color = Color(0xFFFF0000);
    Paint remainingBarColor = Paint()..color = Color(0xFF00FF00);
    canvas.drawRect(healthBarRect, healthBarColor);
    canvas.drawRect(remainingHealthRect, remainingBarColor);

  }

  void update(double t){
      double barWidth = game.screenSize.width / 1.50;

      double percentHealth = game.vehicle.vehicleAttribute.currentHitPoint / game.vehicle.vehicleAttribute.maxHitPoint;
          remainingHealthRect = Rect.fromLTWH(
            game.screenSize.width / 2 - barWidth / 2,
            game.screenSize.height * 0.03,
            barWidth * percentHealth,
      game.tileSize * 0.3,
          );
   
    
     }

}
