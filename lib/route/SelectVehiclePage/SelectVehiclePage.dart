import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/models/MVehicle.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/repository/VehicleRepository.dart';
import 'package:space_survival/route/SelectVehiclePage/SelectVehicleDetail.dart';

class SelectVehiclePage extends StatefulWidget {
  const SelectVehiclePage({Key key}) : super(key: key);

  @override
  _SelectVehiclePageState createState() => _SelectVehiclePageState();
}

class _SelectVehiclePageState extends State<SelectVehiclePage> {
  double coin;
  List<MVehicle> purchased;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(shrinkWrap: true, children: <Widget>[
        CustomWidget.backButton(context, Routes.main_page, coin,
            isRemovePreviousBackStack: true),
        SelectVehicleHeaderUI(),
        SelectVehicleContentUI(
          vehicles: purchased,
        ),
      ]),
    );
  }

  Future<void> getData() async {
    await CoinRepository.getCoin().then((value) {
      setState(() {
        coin = value;
      });
    });

    await VehicleRepository.getPurchasedVehicles().then((value) {
      // List<MVehicle> purchaseVehicles = List<MVehicle>(); (Deprecated)
      List<MVehicle> purchaseVehicles = [];

      List<VehicleFeatures> vehicleFeatures = value;

      vehicleFeatures.forEach((feature) {
        String gifPath = VehicleSprite.getVehicleGif(feature);

        MVehicle purchaseVehicle =
            MVehicle(features: feature, gifPath: gifPath);

        purchaseVehicles.add(purchaseVehicle);
      });

      setState(() {
        purchased = purchaseVehicles;
      });
    });
  }
}
