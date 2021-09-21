import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Sensor/SensorPage.dart';
import '../../Controls/GetAssets.dart';

class ListviewItemRoom extends StatefulWidget {
  final int itemIndex;

  ListviewItemRoom(
    this.itemIndex,
  );

  @override
  _ListviewItemRoomState createState() => _ListviewItemRoomState();
}

class _ListviewItemRoomState extends State<ListviewItemRoom> {
  String roomName = '';
  var imageUrl = '';

  @override
  void initState() {
    super.initState();
    getRoomName(widget.itemIndex);
    imageUrl = setRoomUrl(widget.itemIndex);
  }

  //SensorName
  void getRoomName(int index) {
    roomName = 'Roomname ' + '${widget.itemIndex}';
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(
            255, 17, 23, 36)), //MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        print('Open Room: ' + '$roomName');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SensorPage(widget.itemIndex, roomName)),
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
        child: Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 22, 28, 41),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 20,
                ),
                SvgPicture.asset(
                  '$imageUrl',
                  width: 90,
                  height: 90,
                ),
                Container(
                  width: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$roomName',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
