import 'package:space_survival/components/vehicle/spaceship.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vertex.dart';
import 'package:space_survival/logic/vehicleBeaviour.dart';
import 'package:space_survival/spaceSurvivalGame.dart';
/*
 vehicle that available in the game
 */
enum VehicleFeatures{
  spaceship,
  vertex
}


/*
Create Vehicle Object
*/
class VehicleCreate{


  static Vehicle initVehicleFeatures(SpaceSurvivalGame game,VehicleFeatures vehicleFeature){
    
    Vehicle vehicle;
    VehicleBehaviourType vehicleBehaviourType;
    
    switch(vehicleFeature){
      case VehicleFeatures.spaceship:
        
        //set vehicle behaviour
        vehicleBehaviourType = VehicleBehaviourType.type_2;
        
        //set vehicle attribute
        VehicleAttribute vehicleAttribute = VehicleAttribute.getAttribute(vehicleFeature,game);

        vehicle = Spaceship(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute
        );

        // Weapon weapon  = new ElectricBullet(game,
        //                                         targetCormet,
        //                                         vehicle.vehicleRect.left,
        //                                         vehicle.vehicleRect.top,
        //                                         game.tileSize * 1.2,
        //                                         game.tileSize * 1.2
        //                                         );        
      break;

      case VehicleFeatures.vertex:

        //set vehicle behaviour
        vehicleBehaviourType = VehicleBehaviourType.type_2;

        //set vehicle attribute
        VehicleAttribute vehicleAttribute = VehicleAttribute.getAttribute(vehicleFeature,game);

        
        vehicle = Vertex(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute
        );
      break;


      default:
        //set vehicle behaviour
        vehicleBehaviourType = VehicleBehaviourType.type_1;

        //set vehicle attribute
        VehicleAttribute vehicleAttribute = VehicleAttribute.getAttribute(vehicleFeature,game);

        
        vehicle = Spaceship(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute
        );
      break;
      
    }

    return vehicle;
  }

  
}


/* 
Vehicle Attribute

Here, can set dmg,hp and any other attribute that want to set.
This features only for vehicle object/class only
*/
class VehicleAttribute {
  
  final double price;
  final double widthComponent;
  final double heightComponent;
  double speed;
  final int maxHitPoint;
  int currentHitPoint;
  final int damage;
  final int maxShield;
  int currentShield;
  final int maxUsedInterval;
  final int minUsedInterval;
  final int intervalChange;

  VehicleAttribute({
    this.price,
    this.widthComponent,
    this.heightComponent,
    this.speed,
    this.maxHitPoint,
    this.currentHitPoint,
    this.damage,
    this.maxShield,
    this.currentShield,
    this.maxUsedInterval,
    this.minUsedInterval,
    this.intervalChange,
  });



  /*
  get attribute of the vehicle by vehicleFeatures 
  */
  static VehicleAttribute getAttribute(VehicleFeatures vehicleFeature,SpaceSurvivalGame game){
    VehicleAttribute vehicleAttribute;
    
    switch(vehicleFeature){
      case VehicleFeatures.spaceship:

        vehicleAttribute = VehicleAttribute(
                            price: 0,
                            widthComponent: game.tileSize * 1.5,
                            heightComponent:  game.tileSize * 1.5,
                            speed:  game.tileSize * 0.5,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 1,
                            maxShield: 1,
                            currentShield: 1,
                            maxUsedInterval: 3000,
                            minUsedInterval: 3000,
                            intervalChange: 3
                            );

      break;
      case VehicleFeatures.vertex:
        vehicleAttribute = VehicleAttribute(
                            price: 50,
                            widthComponent: game.tileSize * 1.5,
                            heightComponent:  game.tileSize * 1.5,
                            speed:  game.tileSize * 2.0,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 2,
                            maxShield: 2,
                            currentShield: 2,
                            maxUsedInterval: 2000,
                            minUsedInterval: 2000,
                            intervalChange: 3
                            );
      break;
      default:
        vehicleAttribute = VehicleAttribute(
                            price: 50,
                            widthComponent: game.tileSize * 1.5,
                            heightComponent:  game.tileSize * 1.5,
                            speed:  game.tileSize * 0.5,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 1,
                            maxShield: 1,
                            currentShield: 1,
                            maxUsedInterval: 3000,
                            minUsedInterval: 3000,
                            intervalChange: 3
                            );
      break;
    }

    return vehicleAttribute;

  }

  
}
