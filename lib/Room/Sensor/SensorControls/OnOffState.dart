import 'package:flutter/material.dart';

class OnOffState extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;

  OnOffState(
    this.roomName,
    this.sensorName,
    this.sensorType,
  );

  @override
  _OnOffStateState createState() => _OnOffStateState();
}

class _OnOffStateState extends State<OnOffState> {
  bool buttonState = true;

  @override
  void initState() {
    super.initState();
    getValue(widget.roomName, widget.sensorType, widget.sensorName);
  }

  void getValue(String roomName, int sensortype, String sensorName) {
    //get from database
    buttonState = false;
  }

  void setValue(
      String roomName, int sensortype, String sensorName, bool value) {
    print('State: ' +
        '$roomName' +
        ', ' +
        '$sensortype' +
        ', ' +
        '$sensorName' +
        ': ' +
        '$value');
    //send Database + MQTT Value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 22, 28, 41),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Container(
                    width: 25,
                  ),
                  Text(
                    'State',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Switch(
                    value: buttonState,
                    onChanged: (value) {
                      setState(() {
                        buttonState = value;
                      });
                      setValue(widget.roomName, widget.sensorType,
                          widget.sensorName, value);
                    },
                  ),
                  Container(
                    width: 25,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
