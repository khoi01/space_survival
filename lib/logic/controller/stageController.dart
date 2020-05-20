import 'package:space_survival/spaceSurvivalGame.dart';

enum Stage{
  stage_1, // 2 minute
  stage_2, // 2 minute
  stage_final // final
  
}



class StageAttribute{
  final Stage stage;
  final int maxSpawnInternval;
  final int minSpawnInterval;
  final int intervalChange;
  final int maxCometOnScreen;
  final int stageDuration;
  StageAttribute({this.stage, this.maxSpawnInternval, this.minSpawnInterval, this.intervalChange, this.maxCometOnScreen, this.stageDuration});

  

static StageAttribute getAttribute(Stage stage,SpaceSurvivalGame game){
  StageAttribute stageAttribute;

  switch(stage){
    case Stage.stage_1:
    stageAttribute = StageAttribute(
      stage: Stage.stage_1,
      maxSpawnInternval: 2000,
      minSpawnInterval: 1500,
      intervalChange: 3,
      maxCometOnScreen: 6,
      stageDuration: 120000 // 2 minute
    ); 
    break;
    case Stage.stage_2:
    stageAttribute = StageAttribute(
      stage: Stage.stage_2,
      maxSpawnInternval: 2000,
      minSpawnInterval: 1500,
      intervalChange: 3,
      maxCometOnScreen: 7,
      stageDuration: 120000 // 2 minute
    );
    break;
    case Stage.stage_final:
    stageAttribute = StageAttribute(
      stage: Stage.stage_final,
      maxSpawnInternval: 2000,
      minSpawnInterval: 1500,
      intervalChange: 3,
      maxCometOnScreen: 8,
      stageDuration: 0
    );
    break;
    default:
    stageAttribute = StageAttribute(
      stage: Stage.stage_1,
      maxSpawnInternval: 2000,
      minSpawnInterval: 1500,
      intervalChange: 3,
      maxCometOnScreen: 6,
      stageDuration: 120000 // 2 minute
    );
    break;

    

  }

  return stageAttribute;
}
}
