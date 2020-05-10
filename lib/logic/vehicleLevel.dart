import 'package:flutter/cupertino.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
import 'package:space_survival/util.dart';


class VehicleLevel{

  // min/max able to reach/go
  final double minXPosition;
  final double maxXPosition;

  // min/max able to reach/go
  final double minYPosition;
  final double maxYPosition;

  //default vehicle spawn location
  final double setXRandomPosition;
  final double setYRandomPosition;

  Offset targetLocation;


  final SpaceSurvivalGame game;

  
  
  VehicleLevel({this.game,
  this.minXPosition,this.maxXPosition,
  this.minYPosition,this.maxYPosition,
  this.setXRandomPosition,this.setYRandomPosition
  });



  
  static setLevel(SpaceSurvivalGame game,Level level,double widthComponent,double heightComponent){   

    switch (level) {

      case  Level.one:
      

        VehicleCordinate newCordinates = getNewLocattion(game, level, widthComponent, heightComponent);

        return VehicleLevel(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
            );
     
        break;
      case Level.two:

        VehicleCordinate newCordinates = getNewLocattion(game, level, widthComponent, heightComponent);


        return VehicleLevel(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
            );
     
        break;

      case Level.test_collision_comet_and_spaceships:

        return VehicleLevel(
          minXPosition: 0,
          maxXPosition: 0,
          minYPosition: 0,
          maxYPosition: 0,
          setXRandomPosition: game.screenSize.width / 2.4 - (widthComponent/2),
          setYRandomPosition: game.screenSize.height/2 - (heightComponent/2)
        );
      default:
              
        VehicleCordinate newCordinates = getNewLocattion(game, level, widthComponent, heightComponent);


        return VehicleLevel(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
            );
     
        break;
    }
  } 
  

  static VehicleCordinate getNewLocattion(SpaceSurvivalGame game,Level level,double widthComponent,double heightComponent){

      switch(level){
        case Level.one:
        
        double minYPos = game.screenSize.height * 0.8;
        double maxYPos = game.screenSize.height;

        double x = game.random.nextDouble() * ((game.screenSize.width) - widthComponent);
        double y = game.random.nextDouble() * (maxYPos - minYPos) + minYPos - heightComponent;

        return VehicleCordinate(
          minYPosition: minYPos,
          maxYPosition: maxYPos,
          newXPosition: x,
          newYPosition: y
        );

        break;
        case Level.two:

        double minYPos = game.screenSize.height * 0.6;
        double maxYPos = game.screenSize.height;

        double x = game.random.nextDouble() * ((game.screenSize.width) - widthComponent);
        double y = game.random.nextDouble() * (maxYPos - minYPos) + minYPos - heightComponent;

        return VehicleCordinate(
          minYPosition: minYPos,
          maxYPosition: maxYPos,
          newXPosition: x,
          newYPosition: y
        );
        break;

        default:

        double minYPos = game.screenSize.height * 0.8;
        double maxYPos = game.screenSize.height;

        double x = game.random.nextDouble() * ((game.screenSize.width) - widthComponent);
        double y = game.random.nextDouble() * (maxYPos - minYPos) + minYPos - heightComponent;

        return VehicleCordinate(
          minYPosition: minYPos,
          maxYPosition: maxYPos,
          newXPosition: x,
          newYPosition: y
        );

        break;
      }
  }
}


class VehicleCordinate{
  final double minYPosition;
  final double maxYPosition;
  final double newXPosition;
  final double newYPosition;

  VehicleCordinate({this.minYPosition, this.maxYPosition, this.newXPosition, this.newYPosition});
}

