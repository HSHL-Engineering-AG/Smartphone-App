import 'package:flutter/material.dart';
import '../../../Controls/GetAssets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../SensorControls/OnOffState.dart';
import '../SensorControls/Brightness.dart';
import '../SensorControls/Color.dart';
import '../SensorControls/Speed.dart';
import '../SensorControls/ModeNormal.dart';
import '../SensorControls/ContinueButton.dart';

class StripRGBSettings extends StatefulWidget {
  final int itemIndex;
  final int sensorIndex;
  final String roomName;
  final String sensorName;

  StripRGBSettings(
    this.itemIndex,
    this.sensorIndex,
    this.roomName,
    this.sensorName,
  );

  @override
  _StripRGBSettingsState createState() => _StripRGBSettingsState();
}

class _StripRGBSettingsState extends State<StripRGBSettings> {
  String sensorImageUrl = '';

  @override
  void initState() {
    super.initState();
    sensorImageUrl = setSensorUrl(widget.sensorIndex);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '${widget.sensorName}',
              style: TextStyle(
                color: Color.fromARGB(255, 220, 220, 220),
              ),
            ),
            actions: [
              SvgPicture.asset(
                '$sensorImageUrl',
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              Container(
                width: 20,
              ),
            ],
            backgroundColor: Color.fromARGB(255, 15, 16, 23),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromARGB(255, 17, 23, 36),
            child: Container(
              child: ListView(
                children: [
                  OnOffState(widget.roomName, widget.sensorName, 2),
                  Brightness(widget.roomName, widget.sensorName, 2),
                  ColorButton(widget.roomName, widget.sensorName, 2, 1),
                  ColorButton(widget.roomName, widget.sensorName, 2, 2),
                  ColorButton(widget.roomName, widget.sensorName, 2, 3),
                  ModeNormal(widget.roomName, widget.sensorName, 2),
                  Speed(widget.roomName, widget.sensorName, 2),
                  ContinueButton(),
                ],
              ),
            ),
          ),
        ),
      );
}
