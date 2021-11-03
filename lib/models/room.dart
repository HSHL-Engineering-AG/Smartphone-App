import 'package:hive/hive.dart';
part 'room.g.dart';


@HiveType(typeId: 1)
class Room{
  @HiveField(0)
  String roomName;
  @HiveField(1)
  List<String> devices;

  Room({
    required this.roomName,
    required this.devices
  });
}
//flutter packages pub run build_runner build