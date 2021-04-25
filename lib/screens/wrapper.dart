import 'package:fast_relief/models/flutterUser.dart';
import 'package:fast_relief/screens/authenticate/authenticate.dart';
import 'package:fast_relief/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FlutterUser>(context);

    //return either home or authenticate
    if (user == null) {
      return Authenticate();
    }else {
      return Home();
    }
  }
}
