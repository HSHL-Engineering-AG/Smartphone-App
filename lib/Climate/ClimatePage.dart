import 'package:flutter/material.dart';

class ClimatePage extends StatefulWidget {
  const ClimatePage({Key? key}) : super(key: key);

  @override
  _ClimatePageState createState() => _ClimatePageState();
}

class _ClimatePageState extends State<ClimatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 17, 23, 36),
      child: Center(
        child: Text(
          "Climate",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
