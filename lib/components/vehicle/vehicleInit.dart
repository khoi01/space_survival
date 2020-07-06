import 'package:flame/sprite.dart';
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

        //set vehicle Sprite;
        VehicleSprite vehicleSprite = VehicleSprite.getVehicleSprite(vehicleFeature);

        vehicle = Spaceship(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute,
                                              vehicleSprite
        );      
      break;

      case VehicleFeatures.vertex:

        //set vehicle behaviour
        vehicleBehaviourType = VehicleBehaviourType.type_2;

        //set vehicle attribute
        VehicleAttribute vehicleAttribute = VehicleAttribute.getAttribute(vehicleFeature,game);


        //set vehicle Sprite;
        VehicleSprite vehicleSprite = VehicleSprite.getVehicleSprite(vehicleFeature);

        vehicle = Vertex(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute,
                                              vehicleSprite
        );
      break;


      default:
        //set vehicle behaviour
        vehicleBehaviourType = VehicleBehaviourType.type_1;

        //set vehicle attribute
        VehicleAttribute vehicleAttribute = VehicleAttribute.getAttribute(vehicleFeature,game);

        //set vehicle Sprite;
        VehicleSprite vehicleSprite = VehicleSprite.getVehicleSprite(vehicleFeature);
        
        vehicle = Spaceship(game,
                        VehicleBehaviour.setBehaviour(game,
                                              vehicleBehaviourType,
                                              vehicleAttribute.widthComponent,
                                              vehicleAttribute.heightComponent,
                                              ),
                                              vehicleAttribute,
                                              vehicleSprite
        );
      break;
      
    }

    return vehicle;
  }


  static VehicleFeatures stringtoEnum(String string){

    VehicleFeatures features;
    if(string == VehicleFeatures.spaceship.toString()){
      features = VehicleFeatures.spaceship;
    }else if(string == VehicleFeatures.vertex.toString()){
      features = VehicleFeatures.vertex;
    }

    return features;
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
  final int shieldDuration;
  final int durationWhenGotHit;

  VehicleAttribute({
    this.price, //the price of this ship
    this.widthComponent, //the size of this ship
    this.heightComponent, //the size of this ship
    this.speed, //the movement speed of this ship
    this.maxHitPoint, //max hp that this ship can have
    this.currentHitPoint, //current hitpoint available
    this.damage, //weapon dmg of this ship
    this.maxShield, //max ship that this ship can have
    this.currentShield, //current shield that available
    this.maxUsedInterval, //reload weapon
    this.minUsedInterval, //reload weapon
    this.intervalChange,//reload weapon
    this.shieldDuration, //shield available
    this.durationWhenGotHit,
  });



  /*
  get attribute of the vehicle by vehicleFeatures 
  */
  static VehicleAttribute getAttribute(VehicleFeatures vehicleFeature,SpaceSurvivalGame game,{bool isNull = false}){
    VehicleAttribute vehicleAttribute;
    
    switch(vehicleFeature){
      case VehicleFeatures.spaceship:

        vehicleAttribute = VehicleAttribute(
                            price: 0,
                            widthComponent: isNull ? 0 : game.tileSize * 1.5,
                            heightComponent:  isNull ? 0 : game.tileSize * 1.5,
                            speed:  isNull ? 0 :  game.tileSize * 0.8,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 1,
                            maxShield: 1,
                            currentShield: 1,
                            maxUsedInterval: 2000,
                            minUsedInterval: 2000,
                            intervalChange: 3,
                            shieldDuration: 3000,
                            durationWhenGotHit: 1000,
                            );

      break;
      case VehicleFeatures.vertex:
        vehicleAttribute = VehicleAttribute(
                            price: 5,
                            widthComponent: isNull ? 0 : game.tileSize * 3.10,
                            heightComponent:  isNull? 0 : game.tileSize * 2.10,
                            speed:  isNull ? 0 : game.tileSize * 0.7,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 2,
                            maxShield: 2,
                            currentShield: 2,
                            maxUsedInterval: 1900,
                            minUsedInterval: 1900,
                            intervalChange: 3,
                            shieldDuration: 2500,
                            durationWhenGotHit: 1000
                            );
      break;
      default:
        vehicleAttribute = VehicleAttribute(
                            price: 0,
                            widthComponent: isNull ? 0 : game.tileSize * 1.5,
                            heightComponent:  isNull ? 0 : game.tileSize * 1.5,
                            speed:  isNull ? 0 : game.tileSize * 0.9,
                            maxHitPoint: 2,
                            currentHitPoint: 2,
                            damage: 1,
                            maxShield: 1,
                            currentShield: 1,
                            maxUsedInterval: 2000,
                            minUsedInterval: 2000,
                            intervalChange: 3,
                            shieldDuration: 3000,
                            durationWhenGotHit: 1000
                            );
      break;
    }

    return vehicleAttribute;

  }

}



class VehicleSprite{

  List<Sprite> vehicleSprites;
  List<Sprite> vehicleShieldSprite;
  List<Sprite> vehicleGotHitSprite;

  static VehicleSprite getVehicleSprite(VehicleFeatures vehicleFeatures){
    
    VehicleSprite vehicleSprite;


    switch(vehicleFeatures){
      case VehicleFeatures.spaceship:

      vehicleSprite = VehicleSprite();
      
      vehicleSprite.vehicleSprites = new List<Sprite>();
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_1.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_2.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_3.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_4.png'));

      vehicleSprite.vehicleShieldSprite = new List<Sprite>();
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield1.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield2.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield3.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield4.png'));

      vehicleSprite.vehicleGotHitSprite = new List<Sprite>();
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit1.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit2.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit3.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit4.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit5.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit6.png'));

 
      
      break;
      case VehicleFeatures.vertex:

      vehicleSprite = VehicleSprite();

      vehicleSprite.vehicleSprites = List<Sprite>();
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/vertex/vertex1.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/vertex/vertex2.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/vertex/vertex3.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/vertex/vertex4.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/vertex/vertex5.png'));

      vehicleSprite.vehicleShieldSprite = List<Sprite>();
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/vertex/withShield/vertexWithShield1.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/vertex/withShield/vertexWithShield2.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/vertex/withShield/vertexWithShield3.png'));

      vehicleSprite.vehicleGotHitSprite = new List<Sprite>();
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit1.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit2.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit3.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit4.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit5.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/vertex/gotHit/vertexGotHit6.png'));

      
      break;
      default:


      vehicleSprite = VehicleSprite();
      
      vehicleSprite.vehicleSprites = new List<Sprite>();
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_1.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_2.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_3.png'));
      vehicleSprite.vehicleSprites.add(Sprite('vehicle/spaceship/ship_4.png'));

      vehicleSprite.vehicleShieldSprite = new List<Sprite>();
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield1.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield2.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield3.png'));
      vehicleSprite.vehicleShieldSprite.add(Sprite('vehicle/spaceship/withShield/ship1shield4.png'));

      vehicleSprite.vehicleGotHitSprite = new List<Sprite>();
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit1.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit2.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit3.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit4.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit5.png'));
      vehicleSprite.vehicleGotHitSprite.add(Sprite('vehicle/spaceship/gotHit/ship1GotHit6.png'));
 
      
      break;
    }

    return vehicleSprite;
  }
  

  static String getVehicleGif(VehicleFeatures vehicleFeatures){

    String gifPath;

    switch(vehicleFeatures){
      case VehicleFeatures.spaceship:
        gifPath = 'assets/images/vehicle/spaceship/gif/ship_5.gif';
      break;
      case VehicleFeatures.vertex:
        gifPath = 'assets/images/vehicle/vertex/gif/vertextGif.gif';
      break;
      default:
        gifPath = 'assets/images/assets/imagesvehicle/spaceship/gif/ship_5.gif';

    }

    return gifPath;
  }
}