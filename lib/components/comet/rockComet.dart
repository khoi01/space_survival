
import 'dart:ui';

import 'package:flame/sprite.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/comet/comet.dart';
import 'package:space_survival/logic/cometLevel.dart';
import 'package:space_survival/logic/controller/Stage.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class RockComet extends Comet{
  
  static List<StageSpawnBehaviour> stageSpawnBehaviours;


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
    StageSpawnBehaviour stageSpawnBehaviour;

    //stage_1
    stageSpawnBehaviour = new StageSpawnBehaviour(
      stageInfo: StageInfo.getStage(Stage.stage_1),
      typeClass:  RockComet,
      maxSpawnInternal: 1500,
      minSpawnInterval: 400,
      intervalChange: 3,
      maxComponentOnScreen: 6,
    );
    stageSpawnBehaviours.add(stageSpawnBehaviour);

    //stage_2
    stageSpawnBehaviour = new StageSpawnBehaviour(
      stageInfo: StageInfo.getStage(Stage.stage_2),
      typeClass: RockComet,
      maxSpawnInternal: 1500,
      minSpawnInterval: 300,
      intervalChange: 3,
      maxComponentOnScreen: 7,
    );
    stageSpawnBehaviours.add(stageSpawnBehaviour);

    //stage_final
    stageSpawnBehaviour = new StageSpawnBehaviour(
      stageInfo: StageInfo.getStage(Stage.stage_final),
      typeClass: RockComet,
      maxSpawnInternal: 1500,
      minSpawnInterval: 200,
      intervalChange: 3,
      maxComponentOnScreen: 8,
    );
    stageSpawnBehaviours.add(stageSpawnBehaviour);
  }

  static StageSpawnBehaviour getSpawnBehaviour(Stage stage) {

    if(stageSpawnBehaviours == null){
      setComponentBehaviours();
    }
      StageSpawnBehaviour stageSpawnBehaviour;

      switch(stage){
        case Stage.stage_1:
        stageSpawnBehaviour = stageSpawnBehaviours.firstWhere((element) => element.stageInfo.stage == Stage.stage_1);
        break;
        case Stage.stage_2:
        stageSpawnBehaviour = stageSpawnBehaviours.firstWhere((element) => element.stageInfo.stage == Stage.stage_2);
        break;
        case Stage.stage_final:
        stageSpawnBehaviour = stageSpawnBehaviours.firstWhere((element) => element.stageInfo.stage == Stage.stage_final);
        break;
        default:
        stageSpawnBehaviour = stageSpawnBehaviours.firstWhere((element) => element.stageInfo.stage == Stage.stage_1);
        break;
      }

      return stageSpawnBehaviour;
  }
}