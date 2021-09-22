import 'package:flutter/material.dart';
//NAVIGATOR LÄUFT NICHT
//pages
import './Pages/MainPage.dart';

// WeatherPage(),
// WindowsPage(), --> Into Dashboard
// ClimatePage(),

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Schmart Home",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
