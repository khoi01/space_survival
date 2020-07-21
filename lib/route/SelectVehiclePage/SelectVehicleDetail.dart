import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/models/MVehicle.dart';

class SelectVehicleHeaderUI extends StatelessWidget {
  const SelectVehicleHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Select your vehicle...",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
        ),
      ),
    );
  }
}

class SelectVehicleContentUI extends StatelessWidget {
  const SelectVehicleContentUI({Key key, this.vehicles}) : super(key: key);

  final List<MVehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: MediaQuery.of(context).size.height * 0.65,
        child: vehicles != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: vehicles.length,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: VehicleUI(
                    vehicle: vehicles[index],
                  ),
                ),
              )
            : CircularProgressIndicator());
  }
}

class VehicleUI extends StatefulWidget {
  final MVehicle vehicle;
  VehicleUI({Key key, this.vehicle}) : super(key: key);

  @override
  _VehicleUIState createState() => _VehicleUIState();
}

class _VehicleUIState extends State<VehicleUI> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Start game
        Nav.route(context, Routes.main_game, widget.vehicle.features);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(widget.vehicle.toString()),
            Image.asset(
              widget.vehicle.gifPath,
              height: 160,
              width: 160,
            )
          ],
        ),
      ),
    );
  }
}
