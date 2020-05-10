import 'package:space_survival/spaceSurvivalGame.dart';

class SpawnerComet {
  final SpaceSurvivalGame game;
  final int maxSpawnInternal = 1500; // 1,5 second - limit when to spawn
  final int minSpawnInterval = 100;
  final int intervalChange = 3;
  final int maxCometOnScreen = 6;
  int currentInterval;
  int nextSpawn;

  SpawnerComet(this.game){
    start();
    game.spawnComet();
  }

  void start(){
      destoryAllComet();
      currentInterval = maxSpawnInternal;
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
    if(nowTimestamp >= nextSpawn && cometShowOntheScreen < maxCometOnScreen){
      game.spawnComet();

      //get currentInterval and add with current time and that time will become next spawn.
       if(currentInterval > minSpawnInterval){
         currentInterval -= intervalChange;
         currentInterval -= (currentInterval * .02).toInt();
       }
        
       nextSpawn = nowTimestamp + currentInterval;

    }
  }
}
