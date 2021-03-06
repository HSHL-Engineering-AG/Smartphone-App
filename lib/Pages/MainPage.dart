import 'package:flutter/material.dart';

import '../Settings/SettingsPage.dart';
import '../Room/RoomPage.dart';
import '../Music/MusicPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

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
    return Scaffold(
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
    );
  }
}
