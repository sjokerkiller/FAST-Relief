import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fast_relief/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fast_relief/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fast_relief/screens/home/fast_list.dart';
import 'package:fast_relief/models/fast.dart';
import 'package:flutter/cupertino.dart';
import 'package:fast_relief/screens/home/fidget-cube-interface.dart';


class Home extends StatefulWidget{

  final Function toggleHome;
  Home({ this.toggleHome });

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  bool _play = true;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Fast>>.value(
        value: DatabaseService().fast,
        child: Scaffold(
          backgroundColor: Color(0xFFFFFEE9),
          appBar: AppBar(
            leading: TextButton.icon(
              icon: Icon(
                  Icons.logout,
                color: Color(0xFF963A2F),
              ),
              label: Text(
                ''
              ),
              style: ElevatedButton.styleFrom(primary: Color(0xFFD58258)),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Color(0xFFD58258),
            elevation: 10.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(
                  Icons.crop_square,
                  color: Color(0xFF963A2F),
                ),
                label: Text('FCI'),
                style: TextButton.styleFrom(primary: Color(0xFF963A2F)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FidgetCubeInterface()),
                  );
                },
              ),
            ],
          ),
          body: Stack(
              children: <Widget>[
              FastList(),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 500, 0, 0),
                  child: Center(
                    child: AudioWidget.assets(
                      path: "assets/audios/Chris Mazuera - Dozing.mp3",
                      play: _play,
                      child: ElevatedButton(
                          child: Icon(
                            _play ? Icons.pause : Icons.play_arrow,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF963A2F),
                          ),
                          onPressed: () {
                            setState(() {
                              _play = !_play;
                            });
                          }
                      ),
                      onReadyToPlay: (duration) {
                      },
                      onPositionChanged: (current, duration){
                      },
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}