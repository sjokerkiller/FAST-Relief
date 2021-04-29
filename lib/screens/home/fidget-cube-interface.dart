import 'package:fast_relief/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class FidgetCubeInterface extends StatefulWidget {
  final Function toggleHome;
  FidgetCubeInterface({ this.toggleHome });

  @override
  _FidgetCubeInterface createState() => new _FidgetCubeInterface();
}

class _FidgetCubeInterface extends State<FidgetCubeInterface> {

  double group = 1;
  double slider_value = 0.0;
  bool switch_value1 = false;
  bool switch_value2 = false;
  int selected = 0;
 //int _selectedIndex = 0;

  final items = <String>[
    'Fidget',
    'Anxiety',
    'Stress',
    'Tension',
  ];

  AudioCache _audioCache;
  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(prefix: "assets/audios/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color(0xFFD58258),
          title: new Text('FAST Relief'), centerTitle: true,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(
                Icons.home,
                color: Color(0xFF963A2F),
              ),
              label: Text('Home'),
              style: TextButton.styleFrom(primary: Color(0xFF963A2F)),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
        body:
        Container(
          color: Color(0xFFFFFEE9),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      /*
                    new FlutterLogo(
                        size: 74.0,
                        colors: Colors.blue
                    ),
                    */
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: new Text(
                          "Fidget Cube Interface",
                          style: new TextStyle(fontSize:33.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Letters for Learners"),
                        ),
                      )
                    ]

                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Buttons",
                          style: new TextStyle(fontSize:30.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily:"Letters for Learners"),
                        ),

                        Transform.scale(scale: 2.0,
                          child: new Radio(key:null, groupValue: group, value: 1.0, onChanged: radioChanged1),),

                        Transform.scale(scale: 2.0,
                          child: new Radio(key:null, groupValue: group, value: 2.0, onChanged: radioChanged2),),

                        Transform.scale(scale: 2.0,
                          child: new Radio(key:null, groupValue: group, value: 3.0, onChanged: radioChanged3),),

                        Transform.scale(scale: 2.0,
                          child: new Radio(key:null, groupValue: group, value: 4.0, onChanged: radioChanged4),),

                        Transform.scale(scale: 2.0,
                            child: new Radio(key:null, groupValue: group, value: 5.0, onChanged: radioChanged5)),


                      ]

                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "Switches",
                          style: new TextStyle(fontSize:30.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Letters for Learners"),
                        ),

                        new Switch(onChanged: switchChanged1, value:switch_value1),

                        new Switch(onChanged: switchChanged2, value:switch_value2)
                      ]

                  ),
                ),

                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: new Text(
                          "Sliders",
                          style: new TextStyle(fontSize:30.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Letters for Learners"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: new CupertinoSlider(value: slider_value, onChanged: sliderChanged1, divisions: 5,),
                      )

                    ]

                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: new Text(
                          "Spinning Wheel",
                          style: new TextStyle(fontSize:30.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Letters for Learners"),
                        ),
                      ),


                    ]

                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // styling FortuneItems individually
                      Container(
                        height: 300.0,
                        width: 300.0,
                        child: new FortuneWheel(
                          physics: CircularPanPhysics(
                            duration: Duration(seconds: 1),
                            curve: Curves.decelerate,
                          ),
                          onFling: () {
                            setState(() {
                              selected = Random().nextInt(items.length);
                              HapticFeedback.vibrate();
                              _audioCache.play('wheelspin.mp3');
                            });
                            print("new value" + selected.toString());
                          },

                          selected: selected,
                          items: [
                            // for (var it in items)
                            FortuneItem(
                                child: Text('Fidget'),
                                style: FortuneItemStyle(
                                    color: const Color(0xFF963A2F),
                                    borderColor: Colors.black,
                                    borderWidth: 3
                                )),
                            FortuneItem(
                                child: Text('Anxiety'),
                                style: FortuneItemStyle(
                                    color: const Color(0xFFD58258),
                                    borderColor: Colors.black,
                                    borderWidth: 3
                                )),
                            FortuneItem(
                                child: Text('Stress'),
                                style: FortuneItemStyle(
                                    color: const Color(0xFFECB984),
                                    borderColor: Colors.black,
                                    borderWidth: 3
                                )),
                            FortuneItem(
                                child: Text('Tension'),
                                style: FortuneItemStyle(
                                    color: const Color(0xFFA8A676),
                                    borderColor: Colors.black,
                                    borderWidth: 3
                                )),
                          ],
                        ),
                      ),
                    ]

                ),
              ]

          ),
        ),
        /*
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
              icon: const Icon(Icons.arrow_back),
              title: new Text('Back'),
            ),
         BottomNavigationBarItem(
               icon: const Icon(Icons.home),
                title: new Text('Home'),
        )
    ],
          onTap: _onItemTapped,
    ),

      */
    );
  }

  /*
  void _onItemTapped(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home())
    );
  }

  */
  void switchChanged1(bool value) {
    print(value);
    setState(() {
      switch_value1 = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('switch1.mp3');
  }

  void switchChanged2(bool value) {
    print(value);
    setState(() {
      switch_value2 = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('switch2.mp3');
  }

  void radioChanged1(double value) {
    print(value);
    setState(() {
      group = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('button1.mp3');
  }

  void radioChanged2(double value) {
    print(value);
    setState(() {
      group = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('button2.mp3');
  }

  void radioChanged3(double value) {
    print(value);
    setState(() {
      group = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('button3.mp3');
  }

  void radioChanged4(double value) {
    print(value);
    setState(() {
      group = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('button4.mp3');
  }

  void radioChanged5(double value) {
    print(value);
    setState(() {
      group = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('button5.mp3');
  }

  void sliderChanged1(double value){
    setState(() {
      slider_value = value;
    });
    HapticFeedback.vibrate();
    _audioCache.play('slide-cropped.mp3');
  }
}