import 'package:flutter/material.dart';
import 'OverviewPage.dart';

class SensorPage extends StatefulWidget {
  final int itemIndex;
  final String roomName;

  SensorPage(
    this.itemIndex,
    this.roomName,
  );

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '${widget.roomName}',
              style: TextStyle(
                color: Color.fromARGB(255, 220, 220, 220),
              ),
            ),
            backgroundColor: Color.fromARGB(255, 15, 16, 23),
          ),
          body: OverviewPage(widget.itemIndex, widget.roomName),
        ),
      );
}
