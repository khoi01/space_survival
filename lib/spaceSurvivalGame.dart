
import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:space_survival/components/background/space.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/components/reloadWeapon/ReloadWeapon.dart';
import 'package:space_survival/components/vehicle/spaceship.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/weapon/electricBullet.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/collusionWeaponAndComet.dart';
import 'package:space_survival/logic/spawner/SpawnerComet.dart';
import 'package:space_survival/logic/vehicleLevel.dart';

import 'package:space_survival/util.dart';
import 'package:uuid/uuid.dart';

class SpaceSurvivalGame extends Game{
  
  Size screenSize;
  double tileSize;
  Random random;
  SpawnerComet spawnerComet;
  CollusionWeaponAndComet collusionWeaponAndComet;
  Level level;

  //Components
  Space background;
  Spaceship spaceship;
  List<Comet> comets;
  List<Weapon> weapons;
  ReloadWeapon reloadWeapon;

  bool isTriggerWeapon = false;

  SpaceSurvivalGame(){
    initialize();
  }

  void initialize() async{
    comets = List<Comet>();
    weapons = List<Weapon>();
    collusionWeaponAndComet = CollusionWeaponAndComet(this);

    random = Random();
    resize(await Flame.util.initialDimensions()); //set new screen size

    background = Space(this);

    level = Level.one;

    spawnerComet = SpawnerComet(this);

    spaceship = Spaceship(this,
                          level,
                          VehicleLevel.setLevel(this,
                                                level,
                                                this.tileSize * 1.5,
                                                this.tileSize * 1.5
                                                ),
                          this.tileSize * 1.5,
                          this.tileSize * 1.5
                        );

    reloadWeapon = ReloadWeapon(this,
                                this.screenSize.width  - this.tileSize * 1.8,
                                this.screenSize.height - this.tileSize * 1.8,
                                this.tileSize * 1.8,
                                this.tileSize * 1.8
                              );

    
  }

  @override
  void render(Canvas canvas) {

    background.render(canvas);
    reloadWeapon.render(canvas);

    spaceship.render(canvas);
    comets.forEach((comet) => comet.render(canvas));
    weapons.forEach((weapon) => weapon.render(canvas));
  }

  @override
  void update(double t) {

      spaceship.update(t);

      comets.forEach((comet) => comet.update(t));
      comets.removeWhere((comet) => comet.isOffScreen);
      
      spawnerComet.update(t);
      
      weapons.forEach((weapon) => weapon.update(t));
      weapons.removeWhere((weapon) => weapon.isOffScreen);
      
      collusionWeaponAndComet.update(t);

      reloadWeapon.update(t);

  } 


  void spawnComet(){

    //generate unique id 
    var uuid = Uuid();


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
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width/9;
  }


  //begin launch weapon and destroy the targeted comet
  void launchWeapon(String targetCormet){
      
      ElectricBullet bullet = new ElectricBullet(this,
                                                targetCormet,
                                                this.spaceship.vehicleRect.left,
                                                this.spaceship.vehicleRect.top,
                                                this.tileSize * 1.2,
                                                this.tileSize * 1.2
                                                );
    weapons.add(bullet);
  }

  void onTapDown(TapDownDetails tap){
    bool isHandled = false;

    if(!isHandled /*&& Vehicle.isAbleToLaunchWeapon()*/){
      comets.forEach((comet) {
        if(comet.cometRect.contains(tap.globalPosition) && Vehicle.isAbleToLaunchWeapon()){
          comet.onTapDown();
          isHandled = true;
        }
       });
    }
  }
  
  

}