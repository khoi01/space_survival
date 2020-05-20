
import 'dart:math';
import 'dart:ui';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/components/healthBar/vehicleHealthBar.dart';
import 'package:space_survival/components/reloadWeapon/ReloadWeapon.dart';
import 'package:space_survival/components/shield/shield.dart';
import 'package:space_survival/components/text/score/scoreDisplay.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/electricBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/collusionWeaponAndComet.dart';
import 'package:space_survival/logic/controller/generateShieldDisplay.dart';
import 'package:space_survival/logic/spawner/SpawnerComet.dart';
import 'package:space_survival/util.dart';
import 'package:uuid/uuid.dart';

class SpaceSurvivalGame extends ParallaxComponent{
  
  static SpaceSurvivalGame game;
  final VehicleFeatures vehicleFeatures;
  static BuildContext context;
  static bool isOnGameScreen = true;
  bool isInitialize = false;

  Size screenSize;
  double tileSize;
  Random random;
  SpawnerComet spawnerComet;
  CollusionWeaponAndComet collusionWeaponAndComet;
  Level level;
  int score;

  //Components
  Vehicle vehicle;
  List<Comet> comets;
  List<Weapon> weapons;
  ReloadWeapon reloadWeapon;
  VehicleHealthBar vehicleHealthBar;
  List<Shield> shieldIcons;
  GenerateShieldDisplay generateShieldDisplay;
  //ScoreTextDisplay scoreDisplay;
  ScoreDisplay scoreDisplay;

  SpaceSurvivalGame(List<ParallaxImage> images,this.vehicleFeatures) : super(images){
    isOnGameScreen = true;
    score = 0;
    initializeComponent().then((result){
      isInitialize = result;
    });
    baseSpeed = const Offset(4,0);
    layerDelta = const Offset(0,-50);

  }

  

   Future<bool> initializeComponent() async{

    comets = List<Comet>();
    weapons = List<Weapon>();
    collusionWeaponAndComet = CollusionWeaponAndComet(this);
    generateShieldDisplay = GenerateShieldDisplay(this);

    random = Random();

    resize(await Flame.util.initialDimensions()); //set new screen size

    spawnerComet = SpawnerComet(this);

    vehicle = VehicleCreate.initVehicleFeatures(this,vehicleFeatures);
    vehicleHealthBar = VehicleHealthBar(this);
    shieldIcons = List<Shield>();

    reloadWeapon = ReloadWeapon(this,
                                vehicle,
                                this.screenSize.width  - this.tileSize * 1.8,
                                this.screenSize.height * 0.1 - this.tileSize * 1.8,
                                this.tileSize * 1.8,
                                this.tileSize * 1.8
                              );
    scoreDisplay = ScoreDisplay(this);

    return true;
  }

  @override
  void render(Canvas canvas) {

    super.render(canvas);

    if(isInitialize && isOnGameScreen){

      reloadWeapon.render(canvas);

      vehicle.render(canvas);
      comets.forEach((comet) => comet.render(canvas));
      weapons.forEach((weapon) => weapon.render(canvas));
      vehicleHealthBar.render(canvas);

      shieldIcons.forEach((shield) => shield.render(canvas));
      scoreDisplay.render(canvas);
    }


  
  }

  @override
  void update(double t) {

      super.update(t);

      if(isInitialize && isOnGameScreen){
        vehicle.update(t);
        comets.forEach((comet) => comet.update(t));
        comets.removeWhere((comet) => comet.isOffScreen);
        
        spawnerComet.update(t);
        
        weapons.forEach((weapon) => weapon.update(t));
        weapons.removeWhere((weapon) => weapon.isOffScreen);
        
        collusionWeaponAndComet.update(t);

        reloadWeapon.update(t);

        vehicleHealthBar.update(t);

        shieldIcons.forEach((shield) => shield.update(t));
        shieldIcons.removeWhere((shield) => shield.isOffScreen);

        generateShieldDisplay.update(t);

        scoreDisplay.update(t);

        if(isEndGame()){
          gotoLostPage();
        }
      }
  }


  static void gotoLostPage(){
    int score = SpaceSurvivalGame.game.score;
    SpaceSurvivalGame.isOnGameScreen = false;
    SpaceSurvivalGame.game = null;
    Nav.route(context,Routes.lost_page,score,isRemovePreviousBackStack: true);

  }


  void spawnComet(){

    //generate unique id 
    var uuid = Uuid();

    level = Level.one;

    RockComet rockComet = RockComet(this,
                                    uuid.v1(),
                                    level, 
                                    CometLevel.setLevel(this,
                                                        level, 
                                                        this.tileSize * 1.5,
                                                        this.tileSize * 1.5
                                                        ),
                                      this.tileSize * 1.5,
                                      this.tileSize * 1.5
                                  );

    comets.add(rockComet);
  }

  @override
  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width/9;
    super.resize(size);
  }


  //begin launch weapon and destroy the targeted comet
  void launchWeapon(String targetCormet){
      
      ElectricBullet bullet = new ElectricBullet(this,
                                                targetCormet,
                                                this.vehicle.vehicleRect.left,
                                                this.vehicle.vehicleRect.top,
                                                this.tileSize * 1.2,
                                                this.tileSize * 1.2
                                                );


    weapons.add(bullet);
  }

  void onTapDown(TapDownDetails tap){
    bool isHandled = false;

    //with comet need to destroy
    if(!isHandled){
      comets.forEach((comet) {
        if(comet.cometRect.contains(tap.globalPosition) && vehicle.isAbleToLaunchWeapon()){
          comet.onTapDown();
          isHandled = true;
        }
       });
    }

    //vehicle using shield
    if(!isHandled && vehicle.vehicleRect.contains(tap.globalPosition)){
        vehicle.onTapDown();
        isHandled = true;
    }
  }

  bool isEndGame(){
    bool endGame = false;

    if(vehicle.vehicleAttribute.currentHitPoint <= 0){
      endGame = true;
    }

    return endGame;
  }


  


}