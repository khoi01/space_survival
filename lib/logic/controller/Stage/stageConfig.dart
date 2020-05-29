import 'package:space_survival/logic/controller/Stage/Stage.dart';

class StageConfig{

  static StageInfo getStageSetup(Stage stage){
      StageInfo stageInfo;
      switch(stage){
        case Stage.stage_1:
        stageInfo = StageInfo(
          stage: Stage.stage_1,
          duration: 15000,
          difficulty: 1,
          coin: 1 
          );
        break;
        case Stage.stage_2:
        stageInfo = StageInfo(
          stage: Stage.stage_2,
          duration: 15000,
          difficulty: 2,
          coin: 1.5
        );
        break;
        case Stage.stage_final:
        stageInfo = StageInfo(
          stage: Stage.stage_2,
          duration: 15000,
          difficulty: 3,
          coin: 1.5
        );
        break;
        default:
        stageInfo = StageInfo(
          stage: Stage.stage_1,
          duration: 15000,
          difficulty: 1,
          coin: 1 
          );
        break;
      }

      return stageInfo;
  }
}