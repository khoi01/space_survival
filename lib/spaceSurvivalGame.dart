import 'dart:math';
import 'dart:ui';
import 'package:flame/components/parallax_component.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/components/healthBar/vehicleHealthBar.dart';
import 'package:space_survival/components/reloadWeapon/ReloadWeapon.dart';
import 'package:space_survival/components/shield/shield.dart';
import 'package:space_survival/components/text/score/coinDisplay.dart';
import 'package:space_survival/components/text/score/scoreDisplay.dart';
import 'package:space_survival/components/text/score/stageDisplay.dart';
import 'package:space_survival/components/vehicle/vehicle.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/components/weapon/weapon.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/logic/controller/collusionWeaponAndComet.dart';
import 'package:space_survival/logic/controller/generateShieldDisplay.dart';
import 'package:space_survival/logic/spawner/SpawnerComet.dart';
import 'package:uuid/uuid.dart';
import 'package:audioplayers/audioplayers.dart';

class SpaceSurvivalGame extends ParallaxComponent {
  static SpaceSurvivalGame game;
  final VehicleFeatures vehicleFeatures;
  static BuildContext context;
  static bool isOnGameScreen = true;

  final Stage stage;
  bool isInitialize = false;
  // final Stage stage;
  StageTime stageTime;

  Size screenSize;
  double tileSize;
  Random random;
  SpawnerRockComet spawnerRockComet;
  CollusionWeaponAndComet collusionWeaponAndComet;
  Level level;
  int score;
  double coin;

  //Components
  Vehicle vehicle;
  List<Comet> comets;
  List<Weapon> weapons;
  ReloadWeapon reloadWeapon;
  VehicleHealthBar vehicleHealthBar;
  List<Shield> shieldIcons;
  GenerateShieldDisplay generateShieldDisplay;
  ScoreDisplay scoreDisplay;
  StageDisplay stageDisplay;
  CoinDisplay coinDisplay;

  // AudioPlayer playingBGM;

  SpaceSurvivalGame(
      List<ParallaxImage> images, this.vehicleFeatures, this.stage)
      : super(images) {
    isOnGameScreen = true;
    score = 0;
    coin = 0;
    initializeComponent().then((result) {
      isInitialize = result;
      //playPlayingBGM();
    });
    baseSpeed = const Offset(4, 0);
    layerDelta = const Offset(0, -50);
  }

  Future<bool> initializeComponent() async {
    StageTime.currentStage = this.stage;
    comets = List<Comet>();
    weapons = List<Weapon>();
    collusionWeaponAndComet = CollusionWeaponAndComet(this);
    generateShieldDisplay = GenerateShieldDisplay(this);

    random = Random();

    resize(await Flame.util.initialDimensions()); //set new screen size

    // spawnerRockComet = SpawnerRockComet(this,RockComet.getSpawnBehaviour(stage));

    vehicle = VehicleCreate.initVehicleFeatures(this, vehicleFeatures);
    vehicleHealthBar = VehicleHealthBar(this);
    shieldIcons = List<Shield>();

    reloadWeapon = ReloadWeapon(
        this,
        vehicle,
        this.screenSize.width - this.tileSize * 1.8,
        this.screenSize.height * 0.1 - this.tileSize * 1.8,
        this.tileSize * 1.8,
        this.tileSize * 1.8);
    scoreDisplay = ScoreDisplay(this);
    stageTime = StageTime(this);
    stageDisplay = StageDisplay(this);
    coinDisplay = CoinDisplay(this);
    spawnerRockComet = SpawnerRockComet(
        this, RockComet.getSpawnBehaviour(StageTime.currentStage));

    // playingBGM =
    //     await Flame.audio.loopLongAudio('bgm/bgm_music.mp3', volume: .25);
    // playingBGM.pause();

    return true;
  }

  // void playPlayingBGM() {
  //   playingBGM.pause();
  //   playingBGM.seek(Duration.zero);
  //   playingBGM.resume();
  // }

  // void stopPlayingBGM() {
  //   playingBGM.stop();
  //   playingBGM = null;
  // }

  void reInitializeComponent() {
    spawnerRockComet = null;
    spawnerRockComet = SpawnerRockComet(
        this, RockComet.getSpawnBehaviour(StageTime.currentStage));
    weapons = null;
    weapons = List<Weapon>();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (isInitialize && isOnGameScreen) {
      reloadWeapon.render(canvas);

      vehicle.render(canvas);
      comets.forEach((comet) => comet.render(canvas));
      weapons.forEach((weapon) => weapon.render(canvas));
      vehicleHealthBar.render(canvas);

      shieldIcons.forEach((shield) => shield.render(canvas));
      scoreDisplay.render(canvas);
      stageDisplay.render(canvas);
      coinDisplay.render(canvas);
    }
  }

  @override
  void update(double t) {
    super.update(t);

    if (isInitialize && isOnGameScreen) {
      vehicle.update(t);
      comets.forEach((comet) => comet.update(t));
      comets.removeWhere((comet) => comet.isOffScreen);

      spawnerRockComet.update(t);

      weapons.forEach((weapon) => weapon.update(t));
      weapons.removeWhere((weapon) => weapon.isOffScreen);

      collusionWeaponAndComet.update(t);

      reloadWeapon.update(t);

      vehicleHealthBar.update(t);

      shieldIcons.forEach((shield) => shield.update(t));
      shieldIcons.removeWhere((shield) => shield.isOffScreen);

      generateShieldDisplay.update(t);

      scoreDisplay.update(t);

      stageTime.update(t);
      stageDisplay.update(t);
      coinDisplay.update(t);
      if (isEndGame()) {
        // stopPlayingBGM();
        gotoLostPage();
      }
    }
  }

  static void gotoLostPage() {
    var results = Map();

    results['score'] = SpaceSurvivalGame.game.score;
    results['stage'] = StageTime.currentStage;
    results['coin'] = SpaceSurvivalGame.game.coin;

    SpaceSurvivalGame.isOnGameScreen = false;
    SpaceSurvivalGame.game = null;
    StageTime.currentStage = null;

    Nav.route(context, Routes.lost_page, results,
        isRemovePreviousBackStack: true);
  }

  void spawnComet() {
    //generate unique id
    var uuid = Uuid();

    level = Level.one;

    RockComet rockComet = RockComet(
        this,
        uuid.v1(),
        level,
        CometLevel.setLevel(
            this, level, this.tileSize * 1.5, this.tileSize * 1.5),
        this.tileSize * 1.5,
        this.tileSize * 1.5);

    comets.add(rockComet);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  //begin launch weapon and destroy the targeted comet
  void launchWeapon(String targetCormet) {
    // ElectricBullet bullet = new ElectricBullet(this,
    //                                           targetCormet,
    //                                           this.vehicle.vehicleRect.left,
    //                                           this.vehicle.vehicleRect.top,
    //                                           this.tileSize * 1.2,
    //                                           this.tileSize * 1.2
    //                                           );

    weapons.add(vehicle.triggerWeapon(targetCormet));
  }

  void onTapDown(TapDownDetails tap) {
    bool isHandled = false;

    //with comet need to destroy
    if (!isHandled) {
      comets.forEach((comet) {
        if (comet.cometRect.contains(tap.globalPosition) &&
            vehicle.isAbleToLaunchWeapon()) {
          comet.onTapDown();
          isHandled = true;
        }
      });
    }

    //vehicle using shield
    if (!isHandled && vehicle.vehicleRect.contains(tap.globalPosition)) {
      vehicle.onTapDown();
      isHandled = true;
    }
  }

  bool isEndGame() {
    bool endGame = false;

    if (vehicle.vehicleAttribute.currentHitPoint <= 0) {
      endGame = true;
    }

    return endGame;
  }
}
