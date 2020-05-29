import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class SpawnerRockComet {
  final SpaceSurvivalGame game;
  StageSpawnBehaviour stageSpawnBehaviour;
  int currentInterval;
  int nextSpawn;
  Stage stage;

  SpawnerRockComet(this.game,this.stageSpawnBehaviour){
    start();
    
    game.spawnComet();
  }

  void start(){
      destoryAllComet();
      currentInterval = stageSpawnBehaviour.maxSpawnInternal;
      nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void destoryAllComet(){
      game.comets.forEach((comet) => comet.isDestroy = true);
  }

  void update(double t){
    //get current time
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    //tracking current comets showing on screen;
    int cometShowOntheScreen = 0;

    game.comets.forEach((comet) {
      if(!comet.isDestroy){
        cometShowOntheScreen+=1;
      }
    });

      // current time its higher then nextSpawn && current flies less then max available comets can show/add on the screen
    if(nowTimestamp >= nextSpawn && cometShowOntheScreen < stageSpawnBehaviour.maxComponentOnScreen){
      game.spawnComet();

      //get currentInterval and add with current time and that time will become next spawn.
       if(currentInterval > stageSpawnBehaviour.minSpawnInterval){
         currentInterval -= stageSpawnBehaviour.intervalChange;
         currentInterval -= (currentInterval * .02).toInt();
       }
        
       nextSpawn = nowTimestamp + currentInterval;

    }
  }
}
