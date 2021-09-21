import 'package:flutter/material.dart';

class MovementState extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;

  MovementState(
    this.roomName,
    this.sensorName,
    this.sensorType,
  );

  @override
  _MovementStateState createState() => _MovementStateState();
}

class _MovementStateState extends State<MovementState> {
  String _currentStateText = "empty";

  @override
  void initState() {
    super.initState();
    getValue(widget.roomName, widget.sensorType, widget.sensorName);
  }

  void getValue(String roomName, int sensortype, String sensorName) {
    //get from database
    _currentStateText = "false";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
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
                  Text(
                    '$_currentStateText',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
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
