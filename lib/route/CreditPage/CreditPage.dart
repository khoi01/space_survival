import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/route/CreditPage/CreditPageDetail.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CustomWidget.backButton(context,Routes.main_page,isRemovePreviousBackStack: true),
          CreditHeaderUI(),
          CreditContentUI()
        ],
      ),
    );
  }
}