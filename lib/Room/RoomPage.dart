import 'package:flutter/material.dart';
import 'ListviewItemRoom.dart';
import '../MQTT/MQTTPage.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Home',
          style: TextStyle(
            color: Color.fromARGB(255, 220, 220, 220),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 15, 16, 23),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MQTTPage()),
              );
            },
            icon: Icon(Icons.preview),
          ),
          Container(
            width: 10,
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 17, 23, 36),
        child: Center(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return ListviewItemRoom(index);
            },
          ),
        ),
      ),
    );
  }
}
