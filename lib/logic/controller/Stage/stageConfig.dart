import 'package:space_survival/logic/controller/Stage/Stage.dart';

class StageConfig{

  static StageInfo getStageSetup(Stage stage){
      StageInfo stageInfo;
      switch(stage){
        case Stage.stage_1:
        stageInfo = StageInfo(
          stage: Stage.stage_1,
          duration: 25000,
          difficulty: 1,
          coin: 0.2 
          );
        break;
        case Stage.stage_2:
        stageInfo = StageInfo(
          stage: Stage.stage_2,
          duration: 25000,
          difficulty: 2,
          coin: 0.5
        );
        break;
        case Stage.stage_3:
        stageInfo = StageInfo(
          stage: Stage.stage_3,
          duration: 25000,
          difficulty: 3,
          coin: 0.8
        );
        break;
        case Stage.stage_4:
        stageInfo = StageInfo(
          stage: Stage.stage_4,
          duration: 25000,
          difficulty: 4,
          coin: 1
        );
        break;
        case Stage.stage_5:
        stageInfo = StageInfo(
          stage: Stage.stage_5,
          duration: 25000,
          difficulty: 5,
          coin: 1
        );
        break;
        case Stage.stage_6:
        stageInfo = StageInfo(
          stage: Stage.stage_6,
          duration: 25000,
          difficulty: 6,
          coin: 1
        );
        break;
        case Stage.stage_7:
        stageInfo = StageInfo(
          stage: Stage.stage_7,
          duration: 25000,
          difficulty: 7,
          coin: 1.2
        );
        break;
        case Stage.stage_8:
        stageInfo = StageInfo(
          stage: Stage.stage_8,
          duration: 25000,
          difficulty: 8,
          coin: 1.2
        );
        break;
        case Stage.stage_9:
        stageInfo = StageInfo(
          stage: Stage.stage_9,
          duration: 25000,
          difficulty: 9,
          coin: 1.6
        );
        break;
        case Stage.stage_10:
        stageInfo = StageInfo(
          stage: Stage.stage_10,
          duration: 27000,
          difficulty: 10,
          coin: 1.6
        );
        break;
        case Stage.stage_11:
        stageInfo = StageInfo(
          stage: Stage.stage_11,
          duration: 27000,
          difficulty: 11,
          coin: 1.6
        );
        break;
        case Stage.stage_12:
        stageInfo = StageInfo(
          stage: Stage.stage_12,
          duration: 27000,
          difficulty: 12,
          coin: 1.6
        );
        break;
        case Stage.stage_13:
        stageInfo = StageInfo(
          stage: Stage.stage_13,
          duration: 27000,
          difficulty: 13,
          coin: 1.7
        );
        break;
        case Stage.stage_14:
        stageInfo = StageInfo(
          stage: Stage.stage_14,
          duration: 27000,
          difficulty: 14,
          coin: 1.7
        );
        break;
        case Stage.stage_15:
        stageInfo = StageInfo(
          stage: Stage.stage_15,
          duration: 27000,
          difficulty: 15,
          coin: 1.8
        );
        break;
        case Stage.stage_16:
        stageInfo = StageInfo(
          stage: Stage.stage_16,
          duration: 27000,
          difficulty: 16,
          coin: 1.8
        );
        break;
        case Stage.stage_17:
        stageInfo = StageInfo(
          stage: Stage.stage_17,
          duration: 27000,
          difficulty: 17,
          coin: 1.8
        );
        break;
        case Stage.stage_18:
        stageInfo = StageInfo(
          stage: Stage.stage_18,
          duration: 27000,
          difficulty: 18,
          coin: 1.8
        );
        break;
        case Stage.stage_19:
        stageInfo = StageInfo(
          stage: Stage.stage_19,
          duration: 27000,
          difficulty: 19,
          coin: 1.8
        );
        break;
        case Stage.stage_20:
        stageInfo = StageInfo(
          stage: Stage.stage_20,
          duration: 27000,
          difficulty: 20,
          coin: 1.8
        );
        break;
        default:
        stageInfo = StageInfo(
          stage: Stage.stage_1,
          duration: 25000,
          difficulty: 1,
          coin: 0.2 
          );
        break;
      }

      return stageInfo;
  }
}