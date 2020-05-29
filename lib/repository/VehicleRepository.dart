import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_survival/components/vehicle/vehicleInit.dart';

class VehicleRepository{
  
  static String vehicleKey = "VehicleKey";

  static void buyVehicle(VehicleFeatures vehicle) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String> vehicleAvailable = (preferences.getStringList(vehicleKey) ?? List<String>());
    vehicleAvailable.add(vehicle.toString());
    preferences.setStringList(vehicleKey,vehicleAvailable);
  }

  static Future<List<VehicleFeatures>> getPurchasedVehicles() async{
    
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<VehicleFeatures> features = new List<VehicleFeatures>();
    
    //by default eveyone have this vehicle
    features.add(VehicleFeatures.spaceship);

    List<String> vehicleAvailable = (preferences.getStringList(vehicleKey) ?? List<String>());

    vehicleAvailable.forEach((element) {
      features.add(VehicleCreate.stringtoEnum(element));
    });
    


    return features;
  }
}