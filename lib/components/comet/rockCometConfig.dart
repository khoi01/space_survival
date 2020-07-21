import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';

class RockCometConfig{
  static StageSpawnBehaviour getSpawnBehaviour(Stage stage){
    
        StageSpawnBehaviour stageSpawnBehaviour;

    switch(stage){
      case Stage.stage_1:
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_1),
        typeClass:  RockComet,
        maxSpawnInternal: 2000,
        minSpawnInterval: 1000,
        intervalChange: 3,
        maxComponentOnScreen: 4,
        );
      break;
      case Stage.stage_2:
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_2),
        typeClass: RockComet,
        maxSpawnInternal: 1800,
        minSpawnInterval: 1000,
        intervalChange: 3,
        maxComponentOnScreen: 4,
        );
      break;
      case Stage.stage_3:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_3),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 4,
        );
        break;
      case Stage.stage_4:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_4),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 5,
        );
        break;
      case Stage.stage_5:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_5),
          typeClass: RockComet,
          maxSpawnInternal: 1200,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 5,
        );
        break;
      case Stage.stage_6:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_6),
          typeClass: RockComet,
          maxSpawnInternal: 1000,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 5,
        );
        break;
      case Stage.stage_7:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_7),
          typeClass: RockComet,
          maxSpawnInternal: 1800,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 6,
        );
        break;
      case Stage.stage_8:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_8),
          typeClass: RockComet,
          maxSpawnInternal: 1500,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 6,
        );
        break;
      case Stage.stage_9:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_9),
          typeClass: RockComet,
          maxSpawnInternal: 1200,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 6,
        );
        break;
      case Stage.stage_10:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_10),
          typeClass: RockComet,
          maxSpawnInternal: 1000,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 6,
        );
        break;
      case Stage.stage_11:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_11),
          typeClass: RockComet,
          maxSpawnInternal: 1800,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 7,
        );
        break;
      case Stage.stage_12:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_12),
          typeClass: RockComet,
          maxSpawnInternal: 1600,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 7,
        );
        break;
      case Stage.stage_13:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_13),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 7,
        );
        break;
      case Stage.stage_14:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_14),
          typeClass: RockComet,
          maxSpawnInternal: 1200,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 7,
        );
        break;
      case Stage.stage_15:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_15),
          typeClass: RockComet,
          maxSpawnInternal: 1000,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 7,
        );
        break;
      case Stage.stage_16:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_16),
          typeClass: RockComet,
          maxSpawnInternal: 1800,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 8,
        );
        break;
      case Stage.stage_17:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_17),
          typeClass: RockComet,
          maxSpawnInternal: 1600,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 8,
        );
        break;
      case Stage.stage_18:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_18),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 8,
        );
        break;
      case Stage.stage_19:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_19),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 8,
        );
        break;
      case Stage.stage_20:
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_20),
          typeClass: RockComet,
          maxSpawnInternal: 1400,
          minSpawnInterval: 1000,
          intervalChange: 3,
          maxComponentOnScreen: 8,
        );
        break;
      default:
      //stage_1
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_1),
        typeClass:  RockComet,
        maxSpawnInternal: 2000,
        minSpawnInterval: 1000,
        intervalChange: 4,
        maxComponentOnScreen: 4,
        );
      break;
    }

    return stageSpawnBehaviour;
    
  }
}