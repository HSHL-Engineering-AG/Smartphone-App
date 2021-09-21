import 'package:flutter/material.dart';
//NAVIGATOR LÄUFT NICHT
//pages
import 'Settings/SettingsPage.dart';
import 'Room/RoomPage.dart';
import 'Music/MusicPage.dart';

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
    return MyStatefulWidget();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List _widgetOptions = [
    SettingsPage(),
    RoomPage(),
    MusicPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //drawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromARGB(255, 17, 23, 36),
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          selectedFontSize: 16,
          selectedItemColor: Color.fromARGB(255, 200, 200, 200),
          unselectedItemColor: Color.fromARGB(255, 50, 60, 86),
          backgroundColor: Color.fromARGB(255, 15, 16, 23),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.precision_manufacturing),
              label: 'Settings',
              backgroundColor: Color.fromARGB(255, 15, 16, 23),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Room',
              backgroundColor: Color.fromARGB(255, 15, 16, 23),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Music',
              backgroundColor: Color.fromARGB(255, 15, 16, 23),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
