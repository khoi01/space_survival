import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/route/Tutorial/TutorialPageDetail.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
       body: ListView(
         shrinkWrap: true,
         children: <Widget>[
           CustomWidget.backButton(context,Routes.main_page,isRemovePreviousBackStack: true),
          TutorialHeaderUI(),
         ],
       ),
    );
  }
}