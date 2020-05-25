import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/route/MainPage/MainPageDetail.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            MainTopUI(),
            MainHeaderUI(),
            MainMenuUI(),
          ],
        )
      );
  }

  
}


