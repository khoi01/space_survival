import 'package:space_survival/components/vehicle/vehicleInit.dart';

class MVehicle {
  
  VehicleFeatures features;
  VehicleAttribute attribute;
  VehicleSprite sprite;
  String gifPath;
  String shieldPath;

  MVehicle({
    this.features,
    this.attribute,
    this.sprite,
    this.gifPath,
    this.shieldPath
  });

  @override
  String toString() {
    
    return features.toString().split('.').last;
  }

}
