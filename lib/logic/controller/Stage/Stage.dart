import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/logic/controller/Stage/stageConfig.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

enum Stage {
  stage_1, // 2 minute
  stage_2, // 2 minute
  stage_final // final
}

/*
Stage that exist in the game
*/
class StageInfo {
  final Stage stage; // stage
  final int duration; //how long this stage will perform
  int start; //when (time)  this stage trigger
  int end; // when(time) this stage will end
  final int difficulty; //difficulty of the stage
  final double coin; //reword if pass this stage

  static List<StageInfo> stages;
  static int startGame;

  StageInfo(
      {this.stage,
      this.duration,
      this.start,
      this.end,
      this.difficulty,
      this.coin});

  static begin() {
    generateStages();
  }

  static void generateStages() {
    stages = List<StageInfo>();
    int startGame = Time.getCurrentTime();

    for (var position = Stage.values.indexOf(StageTime.currentStage);
        position < Stage.values.length;
        position++) {
      StageInfo stage = StageConfig.getStageSetup(Stage.values[position]);

      bool isFirstLoop = true;
      if (isFirstLoop) {
        isFirstLoop = false;

        stage.start = startGame;
        stage.end = startGame + stage.duration;
      } else {
        stage.start = stages.last.end;
        stage.end = stages.last.end + stage.duration;
      }

      stages.add(stage);
    }

    // //stage_1
    // int durationStage1 = 15000;
    // StageInfo stage1 = StageInfo(stage: Stage.stage_1,duration: durationStage1,start: startGame,end: startGame+durationStage1,difficulty: 1,coin: 1);
    // //stage_2
    // int durationStage2 = 15000;
    // StageInfo stage2 = StageInfo(stage:Stage.stage_2,duration:durationStage2,start: stage1.end,end: stage1.end+durationStage2,difficulty: 2,coin:  1.5);
    // //stage_final
    // int durationStageFinal = 15000;
    // StageInfo stageFinal = StageInfo(stage: Stage.stage_final,duration:durationStageFinal,start: stage2.end,end:stage2.end+durationStageFinal,difficulty: 3,coin: 2);

    // stages.add(stage1);
    // stages.add(stage2);
    // stages.add(stageFinal);
  }

  static List<StageInfo> getStages() {
    return stages;
  }

  static StageInfo getStage(Stage selectedStage) {
    //StageInfo stageInfo;
    // switch(stage){
    //   case Stage.stage_1:
    //   stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_1);
    //   break;
    //   case Stage.stage_2:
    //   stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_2);
    //   break;
    //   case Stage.stage_final:
    //   stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_final);
    //   break;
    //   default:
    //   stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_1);
    //   break;

    // }

    StageInfo stageInfo =
        getStages().firstWhere((item) => item.stage == selectedStage);

    return stageInfo;
  }
}

/* 
Stage component behaviour 
*/
class StageSpawnBehaviour {
  final Type typeClass;
  final StageInfo stageInfo;
  final int maxSpawnInternal;
  final int minSpawnInterval;
  final int intervalChange;
  final int speed;
  final int maxComponentOnScreen;

  StageSpawnBehaviour(
      {this.stageInfo,
      this.typeClass,
      this.maxSpawnInternal,
      this.minSpawnInterval,
      this.intervalChange,
      this.maxComponentOnScreen,
      this.speed});
}

class StageTime {
  static Stage currentStage;
  final SpaceSurvivalGame game;

  StageTime(this.game) {
    StageInfo.begin();
  }

  void update(double t) {
    //get current time
    int now = Time.getCurrentTime();

    //get info about the current stage
    var stageInfo = StageInfo.getStage(StageTime.currentStage);
    
    //check stage change condition
    if (stageInfo.start < now && now >= stageInfo.end) {
      //get new stage index
      var nextIndex = StageTime.currentStage.index + 1;
      //check if the next stage is exist or not
      if (nextIndex < Stage.values.length) {
        //get the next stage
        var changeStage = Stage.values[StageTime.currentStage.index + 1];
        //update current stage
        currentStage = changeStage;
        //give coin to user everytime go to next stage
        game.coin += StageInfo.getStage(currentStage).coin;
        //change behavour of the stage
        game.reInitializeComponent();
      }
    }
  }
}
