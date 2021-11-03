import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
//NAVIGATOR LÄUFT NICHT
//pages
import './Pages/MainPage.dart';
import './models/room.dart';
import './models/device.dart';

// WeatherPage(),
// WindowsPage(), --> Into Dashboard
// ClimatePage(),

void main() async{
  await Hive.initFlutter();
  await Hive.openBox<Room>("rooms");
  await Hive.openBox<Device>("devices");
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
