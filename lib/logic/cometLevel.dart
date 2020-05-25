import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class CometLevel {

  // min/max able to reach/go
  final double minXPosition;
  final double maxXPosition;

  // min/max able to reach/go
  final double minYPosition;
  final double maxYPosition;

  //default comet spawn location
  final double setXRandomPosition;
  final double setYRandomPosition;

  final double setXFinalPosition;
  final double setYFinalPosition;

  CometLevel({
    this.minXPosition,
    this.maxXPosition,
    this.minYPosition,
    this.maxYPosition,
    this.setXRandomPosition,
    this.setYRandomPosition,
    this.setXFinalPosition,
    this.setYFinalPosition,
  });


  static setLevel(SpaceSurvivalGame game,Level level,double widthComponent,double heightComponent){

    switch(level){
      case Level.one:

        double minYPos = 0;
        double maxYPos = game.screenSize.height * 0.2;

        double x = game.random.nextDouble() * ((game.screenSize.width) - widthComponent);
        double y = game.random.nextDouble() * maxYPos - heightComponent;

        return CometLevel(
          minXPosition: 0,
          maxXPosition: game.screenSize.width - (widthComponent),
          minYPosition: minYPos, //spawn zone location
          maxYPosition: maxYPos, //spawn zone location
          setXRandomPosition: x, //spawn component location
          setYRandomPosition: y, //spawn component location
          setXFinalPosition: x,
          setYFinalPosition: game.screenSize.height - (heightComponent)
        );

      break;
      case Level.two:
      break;

      case Level.test_collision_comet_and_spaceships:
        return CometLevel(
          minXPosition: 0,
          maxXPosition: 0,
          minYPosition: 0,
          setXRandomPosition: game.screenSize.width/2 - (widthComponent/2),
          setYRandomPosition: game.screenSize.height/5 - (widthComponent/2),
          setXFinalPosition:  game.screenSize.width/2 - (widthComponent/2),
          setYFinalPosition: game.screenSize.height - (heightComponent/2)
        );
      break;
      default:
      break;
    }    



  }
}