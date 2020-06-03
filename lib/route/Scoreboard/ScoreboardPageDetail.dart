import 'package:flutter/material.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';

class ScoreboardHeaderUI extends StatelessWidget {
  const ScoreboardHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Scoreboard",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
        ),
      ),
    );
  }
}

class ScoreboardHighestScoreUI extends StatelessWidget {
  final int highestScore;
  final Stage highestStage;
  const ScoreboardHighestScoreUI(
      {Key key, this.highestScore, this.highestStage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text(
            "Score: " + highestScore.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "stage: " +
                highestStage.toString().replaceAll('Stage.', '') +
                " / " +
                Stage.values[Stage.values.length - 1]
                    .toString()
                    .replaceAll('Stage.', ''),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    ));
  }
}
