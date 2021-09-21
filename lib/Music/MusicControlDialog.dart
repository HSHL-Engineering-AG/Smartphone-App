import 'package:flutter/material.dart';

const imageUrl = 'assets/icons/Icon_Playlist_Image_Demo.svg';
const playIcon = Icons.play_arrow;
const pauseIcon = Icons.pause;

class MusicControlDialog extends StatefulWidget {
  const MusicControlDialog({Key? key}) : super(key: key);

  @override
  _MusicControlDialogState createState() => _MusicControlDialogState();
}

class _MusicControlDialogState extends State<MusicControlDialog> {
  bool musicPlaying = false;
  var musicStateIcon;

  @override
  void initState() {
    super.initState();
    getPlayPauseState();
  }

  void getPlayPauseState() {
    //get state from database
    musicPlaying = true;
    if (musicPlaying == true) {
      musicStateIcon = pauseIcon;
    } else {
      musicStateIcon = playIcon;
    }
  }

  void changeState() {
    setState(() {
      musicPlaying = !musicPlaying;
      print('Music is Playing: ' + '$musicPlaying');
      if (musicPlaying == true) {
        musicStateIcon = pauseIcon;
      } else {
        musicStateIcon = playIcon;
      }
    });
    //send to mqtt / database
  }

  void previousSong() {
    print('Previous Song');
    if (musicPlaying == false) {
      changeState();
    }
  }

  void nextSong() {
    print('Next Song');
    if (musicPlaying == false) {
      changeState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Music Settings',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 17, 23, 36),
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      previousSong();
                    },
                    child: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  //
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      changeState();
                    },
                    child: Icon(
                      musicStateIcon,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                  //
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      nextSong();
                    },
                    child: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 50,
          child: Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '      Close      ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
