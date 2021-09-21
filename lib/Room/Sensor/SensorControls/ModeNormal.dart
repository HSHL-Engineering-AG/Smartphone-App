import 'package:flutter/material.dart';

class ModeNormal extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;

  ModeNormal(
    this.roomName,
    this.sensorName,
    this.sensorType,
  );

  @override
  _ModeNormalState createState() => _ModeNormalState();
}

class _ModeNormalState extends State<ModeNormal> {
  String modeName = '';

  @override
  void initState() {
    super.initState();
    getValue(widget.roomName, widget.sensorType, widget.sensorName);
  }

  void getValue(String roomName, int sensortype, String sensorName) {
    //get from database
    modeName = 'Mode Text';
  }

  //void setValue() Down in dialog

  setValue(String roomName, int sensortype, String sensorName, String value) {
    print('Mode: ' +
        '$roomName' +
        ', ' +
        '$sensortype' +
        ', ' +
        '$sensorName' +
        ': ' +
        '$value');
    //set Database Value
  }

  void _update(String name) {
    setState(() {
      modeName = name;
    });
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
                    'Mode',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  //Dialog öffnen
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 17, 23, 36)),
                      fixedSize: MaterialStateProperty.all(Size(210, 70)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => ModeDialog(
                              widget.roomName,
                              widget.sensorName,
                              widget.sensorType,
                              _update));
                    },
                    child: Container(
                      child: Text(
                        '$modeName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
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

class ModeDialog extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;
  final ValueChanged<String> update;

  ModeDialog(
    this.roomName,
    this.sensorName,
    this.sensorType,
    this.update,
  );

  @override
  _ModeDialogState createState() => _ModeDialogState();
}

class _ModeDialogState extends State<ModeDialog> {
  List<bool> isSelected = [true, false, false, false];
  int nowIndex = 0;

  List<String> colorList = [
    "Color",
  ];
  List<String> changerList = [
    "Changer 2 Colors",
    "Changer 3 Colors",
  ];
  List<String> faderList = [
    "Fader Rainbow",
    "Fader 2 Colors",
  ];
  List<String> stroboList = [
    "Strobo",
    "Strobo Random",
  ];

  int returnItemCount() {
    if (nowIndex == 0) {
      return colorList.length;
    }
    if (nowIndex == 1) {
      return changerList.length;
    }
    if (nowIndex == 2) {
      return faderList.length;
    }
    if (nowIndex == 3) {
      return stroboList.length;
    }
    return 0;
  }

  String returnName(int index) {
    String i = '';
    if (nowIndex == 0) {
      i = colorList[index];
    }
    if (nowIndex == 1) {
      i = changerList[index];
    }
    if (nowIndex == 2) {
      i = faderList[index];
    }
    if (nowIndex == 3) {
      i = stroboList[index];
    }
    return i;
  }

  setValue(String roomName, int sensortype, String sensorName, String value) {
    print('Mode: ' +
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
    return AlertDialog(
      title: Text(
        'Music Settings',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 36),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 400,
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ToggleButtons(
                  color: Colors.white,
                  isSelected: isSelected,
                  fillColor: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  selectedColor: Colors.white,
                  borderWidth: 4,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Text('Color'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Text('Changer'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Text('Fader'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 9),
                      child: Text('Strobo'),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    setState(() {
                      nowIndex = newIndex;
                      for (int index = 0; index < isSelected.length; index++) {
                        if (index == newIndex) {
                          isSelected[index] = true;
                        } else {
                          isSelected[index] = false;
                        }
                      }
                    });
                  },
                ),
                Container(
                  height: 30,
                ),
                ListView.builder(
                  itemCount: returnItemCount(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            setValue(widget.roomName, widget.sensorType,
                                widget.sensorName, returnName(index));
                            widget.update(returnName(index));
                            Navigator.of(context).pop();
                          });
                        },
                        style: ButtonStyle(),
                        child: Container(
                          height: 60,
                          child: Center(
                            child: Text(
                              '${returnName(index)}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
