import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/models/MVehicle.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/route/Store/StorePageDetail.dart';
import 'package:space_survival/repository/VehicleRepository.dart';

class StorePage extends StatefulWidget {
  StorePage({Key key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<MVehicle> vehicles;
  List<VehicleFeatures> vehicleAlreadyPurchaseds;
  double coin;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.backgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          CustomWidget.backButton(context, Routes.main_page, coin,
              isRemovePreviousBackStack: true),
          StoreHeaderUI(),
          vehicles != null && vehicleAlreadyPurchaseds != null
              ? StoreVehicleUI(
                  vehicles: vehicles,
                  vehicleAlreadyPurchases: vehicleAlreadyPurchaseds,
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }

  List<MVehicle> getVehicles() {
    // List<MVehicle> vehicles = new List<MVehicle>();(Deprecated)
    List<MVehicle> vehicles = [];

    VehicleFeatures.values.forEach((vehicle) {
      VehicleAttribute attribute =
          VehicleAttribute.getAttribute(vehicle, null, isNull: true);
      VehicleSprite sprite = VehicleSprite.getVehicleSprite(vehicle);
      String gifPath = VehicleSprite.getVehicleGif(vehicle);

      MVehicle mVehicle = new MVehicle(
          features: vehicle,
          attribute: attribute,
          sprite: sprite,
          gifPath: gifPath);

      vehicles.add(mVehicle);
    });

    return vehicles;
  }

  void getData() async {
    vehicles = getVehicles();
    CoinRepository.getCoin().then((value) {
      setState(() {
        coin = value;
      });
    });

    VehicleRepository.getPurchasedVehicles().then((value) {
      setState(() {
        vehicleAlreadyPurchaseds = value;
      });
    });
  }
}
