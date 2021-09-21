import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorButton extends StatefulWidget {
  final int sensorType;
  final String roomName;
  final String sensorName;
  final int colorButton;

  ColorButton(
    this.roomName,
    this.sensorName,
    this.sensorType,
    this.colorButton,
  );

  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  Color color = Colors.red;

  @override
  void initState() {
    super.initState();
    getValue(widget.roomName, widget.sensorType, widget.sensorName);
  }

  void getValue(String roomName, int sensortype, String sensorName) {
    //get from database
    String stringColor = "f3fa03";
    var r = int.parse((stringColor[0] + stringColor[1]), radix: 16);
    var g = int.parse((stringColor[2] + stringColor[3]), radix: 16);
    var b = int.parse((stringColor[4] + stringColor[5]), radix: 16);
    color = Color.fromARGB(255, r, g, b);
  }

  void setValue(
      String roomName, int sensortype, String sensorName, Color value) {
    String convertedColor = color.toString();
    String colorString = '';
    for (int i = 10; i < 16; i++) {
      colorString += convertedColor[i];
    }
    print('Color: ' +
        '$roomName' +
        ', ' +
        '$sensortype' +
        ', ' +
        '$sensorName' +
        ': ' +
        '$colorString');

    //set Database Value
  }

  Widget buildColorPicker() => ColorPicker(
        pickerColor: color,
        enableAlpha: false,
        showLabel: false,
        onColorChanged: (color) {
          setState(() => this.color = color);
        },
      );

  void pickColor(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Pick a Color',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 17, 23, 36),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    fixedSize: MaterialStateProperty.all(Size(80, 40)),
                  ),
                  child: Text(
                    'Select',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setValue(widget.roomName, widget.sensorType,
                        widget.sensorName, color);
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      );

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
              //Content
              Row(
                children: [
                  Container(
                    width: 30,
                  ),
                  Text(
                    'Color ' + '${widget.colorButton}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(60, 60)),
                      backgroundColor: MaterialStateProperty.all(color),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          //side: BorderSide(color: Colors.red)
                        ),
                      ),
                    ),
                    onPressed: () => pickColor(context),
                    child: Container(),
                  ),
                  Container(
                    width: 30,
                  ),
                ],
              ),

              //Content
            ],
          ),
        ),
      ),
    );
  }
}
