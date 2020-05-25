import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/models/MVehicle.dart';

class StoreHeaderUI extends StatelessWidget {
  const StoreHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Store",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
        ),
      ),
    );
  }
}

class StoreVehicleUI extends StatelessWidget {
  final List<MVehicle> vehicles;

  const StoreVehicleUI({Key key, this.vehicles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: vehicles.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: VehicleUI(
              vehicle: vehicles[index],
            ),
          ),
        ));
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
           Image.asset(
            widget.vehicle.gifPath,
            height: 150.0,
            width: 150.0,
          ),
          Column(
            children:<Widget>[
              Row(
                children: [
                    Text("Name:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                Text(widget.vehicle.toString())
                ],
              ),
              Row(
                children: [
                    Text("Price:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                Text(widget.vehicle.attribute.price.toString())
                ],
              ),
              Row(
                children: [
                    Text("Hit Point:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),    
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: getTotalOfHitPont(widget.vehicle.attribute.currentHitPoint))
                ],
              ),
              Row(
                
                children: [
                    Text("Shield:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                    Row( mainAxisAlignment: MainAxisAlignment.start, children: getTotalOfShield(widget.vehicle.attribute.currentShield),)   
                ],
                ),
              Row(
                
                children: [
                    Text("Reload duration:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                    Text(widget.vehicle.attribute.minUsedInterval.toString()[0]+" second"),
                ],)
,
              Row(
                
                children: [
                    Text("Shield duration:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                    Text(widget.vehicle.attribute.shieldDuration.toString()[0]+" second"),
                ],)
            ]
          ),
          Expanded(
                      child: FlatButton.icon(onPressed: (){

            }, icon:Icon( Icons.shopping_cart), label: Text("Buy"),),
          )
        ],
      ),
    );
  }

  List<Widget> getTotalOfHitPont(int totalHitPoint){
    List<Widget> hitpoints = new List<Widget>();

    for(var count = 0;count < totalHitPoint;count++){
      hitpoints.add( Image.asset(ImagePath.heartIconPath,width: 25,height: 25,));
    }
    return hitpoints;

  }

  List<Widget> getTotalOfShield(int totalShield){
    List<Widget> shields = new List<Widget>();
    for(var count = 0;count < totalShield;count++){
      shields.add( Image.asset(ImagePath.shieldIconPath,width: 25,height: 25,));

    }
    return shields;
  }
}
