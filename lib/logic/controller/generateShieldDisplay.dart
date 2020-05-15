
import 'package:space_survival/components/shield/shield.dart';
import 'package:space_survival/components/shield/vehicleShield.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class GenerateShieldDisplay{

  final SpaceSurvivalGame game;
  
  GenerateShieldDisplay(this.game);

  void start(){
    destroyAllShield();
    addShieldIcons();
  }

  void destroyAllShield(){
    game.shieldIcons.forEach((shield) => shield.isOffScreen = true);
  }

  void update(double t){

    destroyAllShield();
    addShieldIcons();
  }

  void addShieldIcons(){
    
  
    Shield shield;

    double newWidthComposition =  0.95;

    for(int count = 0; count< game.vehicle.vehicleAttribute.currentShield;count++){

      shield = VehicleShield(
        game,
        game.screenSize.width * newWidthComposition - game.tileSize * 1.8,
        game.screenSize.height * 0.05,
        game.tileSize * 0.7,
        game.tileSize * 0.7
      );

      game.shieldIcons.add(shield);

      newWidthComposition-= 0.06;
    }

  }

}