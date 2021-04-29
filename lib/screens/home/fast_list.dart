import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_relief/models/fast.dart';
import 'package:provider/provider.dart';
import 'package:fast_relief/screens/home/fast_cards.dart';

class FastList extends StatefulWidget {
  @override
  _FastListState createState() => _FastListState();
}

class _FastListState extends State<FastList> {
  @override
  Widget build(BuildContext context) {

    final fasts = Provider.of<List<Fast>>(context) ?? [];

    /*fast.forEach((fast) {
      print(fast.firstName);
      print(fast.lastName);
      print(fast.hobbies);
      print(fast.music);
    });*/
    return ListView.builder(
      itemCount: fasts.length,
      //itemCount: fasts.length,
      itemBuilder: (context, index) {
        return FastCards(fast: fasts[index]);
      },
    );
  }
}