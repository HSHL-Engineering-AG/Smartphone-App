import 'package:hive/hive.dart';
part 'device.g.dart';

@HiveType(typeId: 0)

class Device{
  @HiveField(0)
  String deviceName;

  @HiveField(1)
  String deviceType;

  @HiveField(2)
  bool stt = true; //State

  @HiveField(3)
  double bts; //Brightness

  @HiveField(4)
  String mod; //Mode

  @HiveField(5)
  String clr; //Color

  @HiveField(6)
  double spd; //Speed

  @HiveField(7)
  double vol; //Volume

  @HiveField(8)
  int rnb; //Room Number

  @HiveField(9)
  double xkd; //X Koordinate

  @HiveField(10)
  double ykd; //Y Koordinate

  @HiveField(11)
  double zkd; //Z Koordinate

  @HiveField(12)
  double tmp; //Temperature

  @HiveField(13)
  double lix = 0; //Light Index

  @HiveField(14)
  String id;

  Device({
    required this.deviceName,
    required this.deviceType,
    required this.stt,
    required this.bts,
    required this.mod,
    required this.clr,
    required this.spd,
    required this.vol,
    required this.rnb,
    required this.xkd,
    required this.ykd,
    required this.zkd,
    required this.tmp,
    required this.lix,
    required this.id
  });
}
//flutter packages pub run build_runner build