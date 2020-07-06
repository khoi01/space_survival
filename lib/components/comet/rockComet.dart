
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/components/comet/rockCometConfig.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class RockComet extends Comet{
  
  static List<StageSpawnBehaviour> stageSpawnBehaviours;

  @override
  double  speed() => game.tileSize * 2.3;


  RockComet(SpaceSurvivalGame game,String cometId,Level level,CometLevel cometLevel, double weightComponent, double heightComponent) : super(game,cometId, level,cometLevel,weightComponent, heightComponent){
    
    cometRect = Rect.fromLTWH(cometLevel.setXRandomPosition,cometLevel.setYRandomPosition, weightComponent, heightComponent);

    cometSprite = List<Sprite>();
    cometSprite.add(Sprite('comet/rock/comet_1.png'));
    cometSprite.add(Sprite('comet/rock/comet_2.png'));
    cometSprite.add(Sprite('comet/rock/comet_3.png'));
    cometSprite.add(Sprite('comet/rock/comet_4.png'));
    cometSprite.add(Sprite('comet/rock/comet_5.png'));
    cometSprite.add(Sprite('comet/rock/comet_6.png'));

    cometLockSprite = List<Sprite>();
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_1.png'));
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_2.png'));
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_3.png'));
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_4.png'));
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_5.png'));
    cometLockSprite.add(Sprite('comet/rock/lock/comet_lock_6.png'));

  }

  static void setComponentBehaviours() {

    stageSpawnBehaviours = List<StageSpawnBehaviour>();
    
    for(var position = Stage.values.indexOf(StageTime.currentStage);position<Stage.values.length;position++){

      StageSpawnBehaviour stageSpawnBehaviour = RockCometConfig.getSpawnBehaviour(Stage.values[position]);
      stageSpawnBehaviours.add(stageSpawnBehaviour);
    }
  }

  static StageSpawnBehaviour getSpawnBehaviour(Stage stage) {

    if(stageSpawnBehaviours == null){
      setComponentBehaviours();
    }
    StageSpawnBehaviour stageSpawnBehaviour = stageSpawnBehaviours.firstWhere((element) => element.stageInfo.stage == stage);


      return stageSpawnBehaviour;
  }
}