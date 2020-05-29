import 'package:flutter/material.dart';
import 'package:space_survival/Utils/customWidget.dart';
import 'package:space_survival/Utils/util.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';
import 'package:space_survival/models/MVehicle.dart';
import 'package:space_survival/repository/CoinRepository.dart';
import 'package:space_survival/repository/VehicleRepository.dart';

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
  final List<VehicleFeatures> vehicleAlreadyPurchases;

  const StoreVehicleUI({Key key, this.vehicles,this.vehicleAlreadyPurchases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: MediaQuery.of(context).size.height * 0.55,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: vehicles.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: VehicleUI(
              vehicle: vehicles[index],
              vehicleAlreadyPurchases: vehicleAlreadyPurchases,
            ),
          ),
        ));
  }
}

class VehicleUI extends StatefulWidget {
  final MVehicle vehicle;
  final List<VehicleFeatures> vehicleAlreadyPurchases;
  VehicleUI({Key key, this.vehicle, this.vehicleAlreadyPurchases}) : super(key: key);

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
                    Text((widget.vehicle.attribute.minUsedInterval * 0.001).toStringAsFixed(1).toString()+" second"),
                ],)
,
              Row(
                
                children: [
                    Text("Shield duration:",style: TextStyle(fontSize: 16,fontStyle: FontStyle.normal),),
                    Text((widget.vehicle.attribute.shieldDuration * 0.001).toStringAsFixed(1).toString()+" second"),
                ],)
            ]
          ),
          Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buttonStatus(widget.vehicle),
                      ),
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


  Widget buttonStatus(MVehicle sellingVehicle){
    Widget widgetdisplay;

        //  if(widget.vehicleAlreadyPurchases == null){
        //    return Text("hello world",style: TextStyle(fontSize: 15,color: Colors.grey.shade600,fontWeight: FontWeight.bold ),);
        //  }
         
        if(widget.vehicleAlreadyPurchases.any((element) => element == sellingVehicle.features)){
          widgetdisplay = Text("Already Purchased",style: TextStyle(fontSize: 15,color: Colors.grey.shade600,fontWeight: FontWeight.bold ),);
        }else{
              widgetdisplay = FlatButton.icon( icon: Icon(Icons.shopping_cart), label: Text("Buy",style: TextStyle(fontSize: 15),), onPressed: (){
              showDialogConfirmBuy(context,sellingVehicle);
              });
        }
        
    return widgetdisplay;
  }

  void showDialogConfirmBuy(BuildContext context,MVehicle vehicle){
      // set up the buttons
      Widget cancelButton = FlatButton(
        child: Text("Cancel"),
        onPressed:  () {
          Navigator.pop(context);
        },
      );
      Widget continueButton = FlatButton(
        child: Text("Continue"),
        onPressed:  () {
            
            CoinRepository.getCoin().then((coin){
                
                if(coin >= vehicle.attribute.price){
                  CoinRepository.deductCoin(vehicle.attribute.price);
                  VehicleRepository.buyVehicle(vehicle.features);
                  CustomWidget.showToasted('Purchased Succes..',true);
                  Nav.route(context,Routes.main_page,null);

                }else{
                  CustomWidget.showToasted('not enought coin!',false);
                  Navigator.pop(context);
                  
                }
            });
        },
      ); 

    // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Confirmation.."),
        content: Text("Are you sure you want to buy this vehicle?"),
        actions: [
          cancelButton,
          continueButton,
        ],
      );  

        // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
  }
}
