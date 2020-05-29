import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/route/CreditPage/CreditPageDetail.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({Key key}) : super(key: key);

  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {

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
          CreditHeaderUI(),
          CreditContentUI()
        ],
      ),
    );
  }
}