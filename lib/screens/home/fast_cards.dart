import 'package:flutter/material.dart';
import 'package:fast_relief/models/fast.dart';

class FastCards extends StatelessWidget {

  final Fast fast;
  FastCards({ this. fast });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Text(
          'Good evening ${fast.firstName}'
        ),
      ),
    );
  }
}
