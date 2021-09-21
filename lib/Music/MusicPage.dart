import 'package:flutter/material.dart';
import 'ListviewItemMusic.dart';
import 'MusicControlDialog.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
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
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => MusicControlDialog());
            },
            icon: Icon(Icons.music_note_outlined),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 17, 23, 36),
        child: Center(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return ListviewItemMusic(index);
            },
          ),
        ),
      ),
    );
  }
}
