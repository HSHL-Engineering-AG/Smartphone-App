import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({Key? key}) : super(key: key);

  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
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
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 17, 23, 36),
        child: Center(
          child: Text(
            "Security",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
