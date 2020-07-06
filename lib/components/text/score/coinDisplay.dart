import 'package:flutter/painting.dart';
import 'package:space_survival/spaceSurvivalGame.dart';

class CoinDisplay{
  final SpaceSurvivalGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  CoinDisplay(this.game){
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

  void render(Canvas canvas){
    painter.paint(canvas, position);
  }

  void update(double t){
    if ((painter.text?.text ?? '') != game.score.toString()) {
      painter.text = TextSpan(
        text: "Coin: "+game.coin.toString(),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.screenSize.width *  0.17) - (painter.width / 2),
        (game.screenSize.height * 0.13) - (painter.height / 2),
      );
    }
  }
}