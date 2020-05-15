import 'package:flutter/cupertino.dart';
import 'package:space_survival/spaceSurvivalGame.dart';


enum VehicleBehaviourType{
  type_1,
  type_2,
  testing,
}

class VehicleBehaviour{

  // min/max able to reach/go
  final double minXPosition;
  final double maxXPosition;

  // min/max able to reach/go
  final double minYPosition;
  final double maxYPosition;

  //default vehicle spawn location
  final double setXRandomPosition;
  final double setYRandomPosition;

  final VehicleBehaviourType vehicleBehaviourType;
  Offset targetLocation;


  final SpaceSurvivalGame game;

  
  
  VehicleBehaviour({this.game,
  this.minXPosition,this.maxXPosition,
  this.minYPosition,this.maxYPosition,
  this.setXRandomPosition,this.setYRandomPosition,
  this.vehicleBehaviourType
  });



  
  static setBehaviour(SpaceSurvivalGame game,VehicleBehaviourType vehicleBehaviourType,double widthComponent,double heightComponent){   

    switch (vehicleBehaviourType) {

      case  VehicleBehaviourType.type_1:
      

        VehicleCordinate newCordinates = getNewLocattion(game, vehicleBehaviourType, widthComponent, heightComponent);

        return VehicleBehaviour(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
              vehicleBehaviourType: VehicleBehaviourType.type_1,
            );
     
        break;
      case VehicleBehaviourType.type_2:

        VehicleCordinate newCordinates = getNewLocattion(game, vehicleBehaviourType, widthComponent, heightComponent);


        return VehicleBehaviour(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
              vehicleBehaviourType: VehicleBehaviourType.type_2,

            );
     
        break;

      case VehicleBehaviourType.testing:

        return VehicleBehaviour(
          minXPosition: 0,
          maxXPosition: 0,
          minYPosition: 0,
          maxYPosition: 0,
          setXRandomPosition: game.screenSize.width / 2.4 - (widthComponent/2),
          setYRandomPosition: game.screenSize.height/2 - (heightComponent/2),
          vehicleBehaviourType: VehicleBehaviourType.testing
        );
      default:
              
        VehicleCordinate newCordinates = getNewLocattion(game, VehicleBehaviourType.type_1, widthComponent, heightComponent);


        return VehicleBehaviour(      
              minXPosition:0,
              maxXPosition:game.screenSize.width - (widthComponent),
              minYPosition:newCordinates.minYPosition,
              maxYPosition:newCordinates.maxYPosition, 
              setXRandomPosition:newCordinates.newXPosition,
              setYRandomPosition:newCordinates.newYPosition,
              vehicleBehaviourType: VehicleBehaviourType.type_1

            );
     
        break;
    }
  } 
  

  static VehicleCordinate getNewLocattion(SpaceSurvivalGame game,VehicleBehaviourType vehicleBehaviourType,double widthComponent,double heightComponent){

      switch(vehicleBehaviourType){
        case VehicleBehaviourType.type_1:
        
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
        case VehicleBehaviourType.type_2:

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

