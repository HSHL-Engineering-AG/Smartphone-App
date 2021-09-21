import 'package:flutter/material.dart';
import 'ListviewItemSensor.dart';

class OverviewPage extends StatefulWidget {
  final int itemIndex;
  final String roomName;

  OverviewPage(
    this.itemIndex,
    this.roomName,
  );

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 17, 23, 36),
      child: Center(
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (BuildContext context, int index) {
            return ListviewItemSensor(widget.itemIndex, index, widget.roomName);
          },
        ),
      ),
    );
  }
}
