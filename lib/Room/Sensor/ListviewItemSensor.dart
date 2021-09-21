import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Controls/GetAssets.dart';
//
import 'SensorSettings/Lamp_Settings.dart';
import 'SensorSettings/StripRGB_Settings.dart';
import 'SensorSettings/StripNeopixel_Settings.dart';
import 'SensorSettings/Powersocket.dart';
import 'SensorSettings/SwitchSchalter_Settings.dart';
import 'SensorSettings/WifiSpeaker_Settings.dart';
import 'SensorSettings/VoiceControl_Settings.dart';
import 'SensorSettings/SensorMovement_Settings.dart';
import 'SensorSettings/SensorTemperature_Settings.dart';
import 'SensorSettings/Plant_Settings.dart';
import 'SensorSettings/FloorLamp_Settings.dart';

class ListviewItemSensor extends StatefulWidget {
  final int roomIndex;
  final int itemIndex;
  final String roomName;

  ListviewItemSensor(
    this.roomIndex,
    this.itemIndex,
    this.roomName,
  );

  @override
  _ListviewItemSensorState createState() => _ListviewItemSensorState();
}

class _ListviewItemSensorState extends State<ListviewItemSensor> {
  int sensortype = 0;
  String sensorName = '';
  var imageUrl = '';

  @override
  void initState() {
    super.initState();
    getSensorName(widget.itemIndex);
    getSensorType(widget.itemIndex);
    imageUrl = setSensorUrl(widget.itemIndex);
  }

  //SensorName
  void getSensorName(int index) {
    sensorName = 'SensorName ' + '$index';
  }

  void getSensorType(int index) {
    sensortype = index;
  }

  void openSettings() {
    switch (sensortype) {
      case 0:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LampSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StripRGBSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StripNeopixelSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 3:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PowersocketSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 4:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SwitchSchalterSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 5:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WifiSpeakerSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 6:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VoiceControlSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 7:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SensorMovementSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 8:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SensorTemperatureSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 9:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlantSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
      case 10:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FloorLampSettings(
                    widget.itemIndex, sensortype, widget.roomName, sensorName)),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 22, 28, 41),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          //Content
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                  ),
                  SvgPicture.asset(
                    '$imageUrl',
                    width: 40,
                    height: 40,
                    color: Colors.white,
                  ),
                  Container(
                    width: 30,
                  ),
                  Text(
                    '$sensorName',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.5,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      openSettings();
                    }),
              ),
            ],
          ),
          //Content
        ),
      ),
    );
  }
}
