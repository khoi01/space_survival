import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';

class ScoreRepository{

  static String scoreKey = "ScoreKey";
  static String stageKey = "StageKey";
  static void setHighestScore(int score) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    int currentHightScore = preferences.getInt(scoreKey) ?? 0;

    if(score > currentHightScore){
      preferences.setInt(scoreKey,score);
    }

    
  }

  static void setHighestStage(int difficulty) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
     int highestDifficulty =  preferences.getInt(stageKey) ?? 1;

    StageInfo highestStage = StageInfo.getStages().firstWhere((element) => element.difficulty == highestDifficulty);
    StageInfo newCurrentStage  = StageInfo.getStages().firstWhere((element) => element.difficulty == difficulty);

    if(newCurrentStage.difficulty > highestStage.difficulty){
      preferences.setInt(stageKey,difficulty);
    }
  }

  static Future<int>  getHighestScore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    int score = preferences.getInt(scoreKey) ?? 0;
    return score;
  }

  static Future<StageInfo> getHighestStage() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int difficulty = preferences.getString(stageKey) ?? 1;
    return StageInfo.getStages().firstWhere((element) => element.difficulty == difficulty);
  }

}