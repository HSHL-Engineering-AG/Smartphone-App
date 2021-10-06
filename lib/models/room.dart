//import 'package:engineering_app/models/deviceType.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)

class Room{
  @HiveField(0)
  String roomName;

  //@HiveField(1)
  //List<DeviceType> deviceTypes;

  Room({
    required this.roomName,
    //required this.deviceTypes,
  });
}