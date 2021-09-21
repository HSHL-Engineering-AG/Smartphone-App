import 'package:flutter/material.dart';

class Volume extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;

  Volume(
    this.roomName,
    this.sensorName,
    this.sensorType,
  );

  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  double _currentSliderValue = 50;

  @override
  void initState() {
    super.initState();
    getValue(widget.roomName, widget.sensorType, widget.sensorName);
  }

  void getValue(String roomName, int sensortype, String sensorName) {
    //get from database
    _currentSliderValue = 50;
  }

  void setValue(String roomName, int sensortype, String sensorName, int value) {
    print('Brightness: ' +
        '$roomName' +
        ', ' +
        '$sensortype' +
        ', ' +
        '$sensorName' +
        ': ' +
        '$value');
    //set Database Value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 22, 28, 41),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 25,
                      ),
                      Text(
                        'Volume',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
                onChangeEnd: (double value) {
                  setValue(widget.roomName, widget.sensorType,
                      widget.sensorName, (_currentSliderValue).toInt());
                },
                divisions: 20,
                label: '${_currentSliderValue.toInt()}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
