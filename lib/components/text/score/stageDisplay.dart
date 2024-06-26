import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:space_survival/logic/controller/Stage/Stage.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class StageDisplay {
  final SpaceSurvivalGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  StageDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 15,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );

    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    // if ((painter.text?.text ?? '') != game.score.toString()) {
      painter.text = TextSpan(
        text: StageTime.currentStage.toString().replaceAll('Stage.', ''),// 'résumé',
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.screenSize.width *  0.17) - (painter.width / 2),
        (game.screenSize.height * 0.10) - (painter.height / 2),
      );
    }
  // }
}