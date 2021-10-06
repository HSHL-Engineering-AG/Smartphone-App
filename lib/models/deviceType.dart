//import 'package:engineering_app/models/device.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)

class DeviceType{
  @HiveField(0)
  String deviceType;

  //@HiveField(1)
  //List<Device> devices;

  DeviceType({
    required this.deviceType,
    //required this.devices,
  });
}