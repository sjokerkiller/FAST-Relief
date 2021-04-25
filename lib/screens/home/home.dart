import 'package:fast_relief/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fast_relief/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fast_relief/screens/home/fast_list.dart';
import 'package:fast_relief/models/fast.dart';
import 'package:flutter/cupertino.dart';
import 'package:fast_relief/screens/home/home_toggle.dart';
import 'package:fast_relief/screens/home/fidget-cube-interface.dart';

class Home extends StatefulWidget{

  final Function toggleHome;
  Home({ this.toggleHome });

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Fast>>.value(
        value: DatabaseService().fast,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Color(0xFFD58258),
            elevation: 0.0,
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(
                    Icons.person,
                    color: Color(0xFF963A2F),
                ),
                label: Text('Logout'),
                style: TextButton.styleFrom(primary: Color(0xFF963A2F)),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
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
          body: FastList(),
        ),
      //),
    );
  }
}