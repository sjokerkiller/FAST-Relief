import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:fast_relief/models/fast.dart';

class FastCards extends StatelessWidget {

  final assetsAudioPlayer = AssetsAudioPlayer();
  final Fast fast;

  FastCards({ this.fast });
  final double height = 200;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset("assets/images/evening.jpg",
            height: height,
            width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, height - 100, 0, 0),
            child: Text(
            'Good ' + greeting() + ' ${fast.firstName}',
              style: TextStyle(
                fontFamily: 'Sweet Talk',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, height + 25, 0, 0),
            child: Image.asset(
              "assets/images/relax.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, height + 70, 0, 0),
            child: Text(
              '${fast.hobbies}' + '\n' +'Take a breath and do it ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Sweet Talk',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }


  String greeting() {
    int hour = DateTime
        .now()
        .hour;
    if (hour < 12) {
      return  'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }
  }

