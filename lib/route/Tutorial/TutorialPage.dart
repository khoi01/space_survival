import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/route/Tutorial/TutorialPageDetail.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key key}) : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {

  double coin;

  @override
  void initState() {
    super.initState();
      CoinRepository.getCoin().then((value){
        setState(() {
          coin = value;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
       body: ListView(
         shrinkWrap: true,
         children: <Widget>[
           CustomWidget.backButton(context,Routes.main_page,coin,isRemovePreviousBackStack: true),
          TutorialHeaderUI(),
         ],
       ),
    );
  }
}