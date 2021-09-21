import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const wifiSpeaker = 'assets/icons/Icon_WiFi_Speaker.svg';

class ListviewItemMusic extends StatefulWidget {
  final int itemIndex;

  ListviewItemMusic(
    this.itemIndex,
  );

  @override
  _ListviewItemMusicState createState() => _ListviewItemMusicState();
}

class _ListviewItemMusicState extends State<ListviewItemMusic> {
  double _currentSliderValue = 80; //--> get from database
  int sensorType = 0;
  String sensorName = '';
  bool buttonState = true;
  var imageUrl = '';

  @override
  void initState() {
    super.initState();
    getSensortype(widget.itemIndex);
    getSensorName(widget.itemIndex);
    getButtonState(widget.itemIndex);
    setImageUrl(widget.itemIndex);
  }

  //Sensortype
  void getSensortype(int index) {
    sensorType = 15; //await Databasehelper...//database
  }

  void setSensortype(int index, int value) {
    print('Volume ' + '${widget.itemIndex}' + ' : ' + '$value');
    //set Database Value
  }

  //SensorName
  void getSensorName(int index) {
    sensorName = 'Empty';
  }

  //ButtonState
  void getButtonState(int index) {
    if (index % 2 == 0) {
      buttonState = false; //await Databasehelper...//database
    } else {
      buttonState = true; //await Databasehelper...//database
    }
  }

  void setButtonState(int index, bool value) {
    print('Buttonstate ' + '${widget.itemIndex}' + ' : ' + '$value');
    //set Database Value
  }

  //Image URL
  void setImageUrl(int index) {
    imageUrl = wifiSpeaker; //await Databasehelper...//database
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 22, 28, 41),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   width: 10,
                    // ),

                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            '$imageUrl',
                            width: 50,
                            height: 50,
                            color: Colors.white,
                          ),
                          Container(
                            width: 50,
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '$sensorName',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: buttonState,
                            onChanged: (value) {
                              setState(() {
                                buttonState = value;
                              });
                              setButtonState(widget.itemIndex, value);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                    setSensortype(
                        widget.itemIndex, (_currentSliderValue).toInt());
                  },
                  divisions: 20,
                  label: '${_currentSliderValue.toInt()}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
