import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

enum Stage{
  stage_1, // 2 minute
  stage_2, // 2 minute
  stage_final // final
}



/*
Stage that exist in the game
*/
class StageInfo{
  
  final Stage stage; // stage 
  final int duration; //how long this stage will perform
  final int start; //when (time)  this stage trigger
  final int end; // when(time) this stage will end
  final int difficulty;  //difficulty of the stage
  final double coin; //reword if pass this stage

  static List<StageInfo> stages;
  static int startGame;

  StageInfo({this.stage, this.duration,this.start, this.end,this.difficulty,this.coin});

  static begin(){
    generateStages();
  }
  static void generateStages(){
    
    stages = List<StageInfo>();
    int startGame = Time.getCurrentTime();
    
    //stage_1
    int durationStage1 = 15000;
    StageInfo stage1 = StageInfo(stage: Stage.stage_1,duration: durationStage1,start: startGame,end: startGame+durationStage1,difficulty: 1,coin: 1);
    //stage_2
    int durationStage2 = 15000;
    StageInfo stage2 = StageInfo(stage:Stage.stage_2,duration:durationStage2,start: stage1.end,end: stage1.end+durationStage2,difficulty: 2,coin:  1.5);
    //stage_final
    int durationStageFinal = 15000;
    StageInfo stageFinal = StageInfo(stage: Stage.stage_final,duration:durationStageFinal,start: stage2.end,end:stage2.end+durationStageFinal,difficulty: 3,coin: 2);

    stages.add(stage1);
    stages.add(stage2);
    stages.add(stageFinal);
      
  }
  
  static List<StageInfo> getStages(){
    return stages;
  }

  static StageInfo getStage(Stage stage){
    StageInfo stageInfo;
    switch(stage){
      case Stage.stage_1:
      stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_1);
      break;
      case Stage.stage_2:
      stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_2);
      break;
      case Stage.stage_final:
      stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_final);
      break;
      default:
      stageInfo =  getStages().firstWhere((item) => item.stage == Stage.stage_1);
      break;
      
    }

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

  StageSpawnBehaviour( {
    this.stageInfo,
    this.typeClass,
    this.maxSpawnInternal,
    this.minSpawnInterval,
    this.intervalChange,
    this.maxComponentOnScreen,
    this.speed
  });
  
}

class StageTime{
  
  static Stage currentStage;
  final SpaceSurvivalGame game;

  StageTime(this.game){
    StageInfo.begin();
  }


  void update(double t){

      int now = Time.getCurrentTime();

      StageInfo.getStages().forEach((stageInfo) {
        
        //state will change base on the time
        if(now > stageInfo.start && now <= stageInfo.end){

          //null?
          if(currentStage == null){
            currentStage = stageInfo.stage;
          }
          // change stage?
          if(isStageChange(stageInfo.stage)){
            currentStage = stageInfo.stage;
            game.coin+=stageInfo.coin;
            game.reInitializeComponent();
          }
        }
      });
    
  }

  

  //want to check if state is change
  static bool isStageChange(Stage newStage){
    
    if(currentStage != newStage){
      return true;
    }else{
      return false;
    }
  }

  
}

