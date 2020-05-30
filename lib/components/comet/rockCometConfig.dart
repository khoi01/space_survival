import 'package:space_survival/components/comet/rockComet.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';

class RockCometConfig{
  static StageSpawnBehaviour getSpawnBehaviour(Stage stage){
    
        StageSpawnBehaviour stageSpawnBehaviour;

    switch(stage){
      case Stage.stage_1:
      //stage_1
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_1),
        typeClass:  RockComet,
        maxSpawnInternal: 1500,
        minSpawnInterval: 400,
        intervalChange: 3,
        maxComponentOnScreen: 1,
        );
      break;
      case Stage.stage_2:
      //stage_2
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_2),
        typeClass: RockComet,
        maxSpawnInternal: 1500,
        minSpawnInterval: 300,
        intervalChange: 3,
        maxComponentOnScreen: 2,
        );
      break;
      case Stage.stage_final:
    //stage_final
        stageSpawnBehaviour = new StageSpawnBehaviour(
          stageInfo: StageInfo.getStage(Stage.stage_final),
          typeClass: RockComet,
          maxSpawnInternal: 1500,
          minSpawnInterval: 200,
          intervalChange: 3,
          maxComponentOnScreen: 3,
        );
        break;
      default:
      //stage_1
      stageSpawnBehaviour = new StageSpawnBehaviour(
        stageInfo: StageInfo.getStage(Stage.stage_1),
        typeClass:  RockComet,
        maxSpawnInternal: 1500,
        minSpawnInterval: 400,
        intervalChange: 3,
        maxComponentOnScreen: 1,
        );
      break;
    }

    return stageSpawnBehaviour;
    
  }
}