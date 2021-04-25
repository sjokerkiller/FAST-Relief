//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_relief/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fast_relief/services/database.dart';
import 'package:provider/provider.dart';
import 'package:fast_relief/screens/home/fast_list.dart';
import 'package:fast_relief/models/fast.dart';

class Home extends StatelessWidget {

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
            ],
          ),
          body: FastList(),
        ),
      //),
    );
  }
}