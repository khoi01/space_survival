
import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_survival/components/background/space.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/components/healthBar/vehicleHealthBar.dart';
import 'package:space_survival/components/reloadWeapon/ReloadWeapon.dart';
import 'package:space_survival/components/shield/shield.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/darkBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/collusionWeaponAndComet.dart';
import 'package:space_survival/logic/controller/generateShieldDisplay.dart';
import 'package:space_survival/logic/spawner/SpawnerComet.dart';

import 'package:space_survival/util.dart';
import 'package:uuid/uuid.dart';

class SpaceSurvivalGame extends Game{
  
  final VehicleFeatures vehicleFeatures;

  Size screenSize;
  double tileSize;
  Random random;
  SpawnerComet spawnerComet;
  CollusionWeaponAndComet collusionWeaponAndComet;
  GenerateShieldDisplay generateShieldDisplay;
  Level level;

  //Components
  Space background;
  Vehicle vehicle;
  List<Comet> comets;
  List<Weapon> weapons;
  ReloadWeapon reloadWeapon;
  VehicleHealthBar vehicleHealthBar;
  List<Shield> shieldIcons;

  bool isTriggerWeapon = false;

  SpaceSurvivalGame(this.vehicleFeatures){
    initialize();
  }

  void initialize() async{
    comets = List<Comet>();
    weapons = List<Weapon>();
    collusionWeaponAndComet = CollusionWeaponAndComet(this);
    generateShieldDisplay = GenerateShieldDisplay(this);

    random = Random();
    //setupBackground();
    resize(await Flame.util.initialDimensions()); //set new screen size
    background = Space(this);



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


    
  }

  @override
  void render(Canvas canvas) {

    background.render(canvas);
    reloadWeapon.render(canvas);

    vehicle.render(canvas);
    comets.forEach((comet) => comet.render(canvas));
    weapons.forEach((weapon) => weapon.render(canvas));
    vehicleHealthBar.render(canvas);

    shieldIcons.forEach((shield) => shield.render(canvas));
  
  }

  @override
  void update(double t) {

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
  }


  //begin launch weapon and destroy the targeted comet
  void launchWeapon(String targetCormet){
      
      // ElectricBullet bullet = new ElectricBullet(this,
      //                                           targetCormet,
      //                                           this.vehicle.vehicleRect.left,
      //                                           this.vehicle.vehicleRect.top,
      //                                           this.tileSize * 1.2,
      //                                           this.tileSize * 1.2
      //                                           );

      DarkBullet bullet = new DarkBullet(this,
                                                targetCormet,
                                                this.vehicle.vehicleRect.left,
                                                this.vehicle.vehicleRect.top,
                                                this.tileSize * 1.5,
                                                this.tileSize * 1.5
                                                );
    weapons.add(bullet);
  }

  void onTapDown(TapDownDetails tap){
    bool isHandled = false;

    if(!isHandled /*&& Vehicle.isAbleToLaunchWeapon()*/){
      comets.forEach((comet) {
        if(comet.cometRect.contains(tap.globalPosition) && vehicle.isAbleToLaunchWeapon()){
          comet.onTapDown();
          isHandled = true;
        }
       });
    }
  }

  // void setupBackground(){
  //   final images = [
  //     // ParallaxImage("bg.png"),
  //     // ParallaxImage("mountain-far.png"),
  //     // ParallaxImage("mountains.png"),
  //     // ParallaxImage("trees.png"),
  //     // ParallaxImage("foreground-trees.png"),
  //     ParallaxImage("background/bg_base.png",repeat: ImageRepeat.repeat,fill: LayerFill.height),
  //     ParallaxImage("background/bg_big_star.png",repeat: ImageRepeat.repeatY,fill: LayerFill.height),
  //     ParallaxImage("background/bg_planet.png",repeat: ImageRepeat.repeat,fill: LayerFill.none),
  //   ];

  //       final parallaxComponent = ParallaxComponent(images,
  //       baseSpeed: const Offset(4,0), layerDelta: const Offset(0,-50));

  //   add(parallaxComponent);
  // }
  
  

}