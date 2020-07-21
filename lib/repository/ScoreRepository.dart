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

  static void setHighestStage(Stage stage) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int highestStageAbletoGet = preferences.getInt(stageKey) ?? 0;
    int newStage = Stage.values.indexOf(stage);
    if(newStage > highestStageAbletoGet){
      preferences.setInt(stageKey,newStage);
    }
  }

  static Future<int>  getHighestScore() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int score = preferences.getInt(scoreKey) ?? 0;
    return score;
  }

  static Future<Stage> getHighestStage() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int highestStageAbletoGet = preferences.getInt(stageKey) ?? 0;
    return Stage.values[highestStageAbletoGet];
  }

}