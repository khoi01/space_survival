import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/logic/controller/Stage/stageConfig.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

enum Stage {
  stage_1,
  stage_2,
  stage_3,
  stage_4,
  stage_5,
  stage_6,
  stage_7,
  stage_8,
  stage_9,
  stage_10,
  stage_11,
  stage_12,
  stage_13,
  stage_14,
  stage_15,
  stage_16,
  stage_17,
  stage_18,
  stage_19,
  stage_20,
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

    bool isFirstLoop = true;

    for (var position = Stage.values.indexOf(StageTime.currentStage);
        position < Stage.values.length;
        position++) {
      //get all available stage
      StageInfo stage = StageConfig.getStageSetup(Stage.values[position]);

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
  }

  static List<StageInfo> getStages() {
    if (stages == null) {
      StageTime.currentStage = Stage.stage_1;
      begin();
    }
    return stages;
  }

  static StageInfo getStage(Stage selectedStage) {
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
