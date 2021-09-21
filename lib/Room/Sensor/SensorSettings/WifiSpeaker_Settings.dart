import 'package:flutter/material.dart';
import '../../../Controls/GetAssets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../SensorControls/OnOffState.dart';
import '../SensorControls/Volume.dart';
import '../SensorControls/ContinueButton.dart';

class WifiSpeakerSettings extends StatefulWidget {
  final int itemIndex;
  final int sensorIndex;
  final String roomName;
  final String sensorName;

  WifiSpeakerSettings(
    this.itemIndex,
    this.sensorIndex,
    this.roomName,
    this.sensorName,
  );

  @override
  _WifiSpeakerSettingsState createState() => _WifiSpeakerSettingsState();
}

class _WifiSpeakerSettingsState extends State<WifiSpeakerSettings> {
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
              width: double.infinity,
              height: double.infinity,
              color: Color.fromARGB(255, 17, 23, 36),
              child: Container(
                child: ListView(
                  children: [
                    OnOffState(widget.roomName, widget.sensorName, 15),
                    Volume(widget.roomName, widget.sensorName, 15),
                    ContinueButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
