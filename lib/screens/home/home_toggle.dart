import 'package:fast_relief/screens/home/home.dart';
import 'package:fast_relief/screens/home/fidget-cube-interface.dart';
import 'package:flutter/material.dart';

  class HomeToggle extends StatefulWidget {
    @override
    _HomeToggle createState() => _HomeToggle();
  }

  class _HomeToggle extends State<HomeToggle> {

    bool showHome = true;
    void toggleHome() {
      setState(() => showHome = !showHome);
    }
    @override
    Widget build(BuildContext context) {
      if (showHome) {
        return Home(toggleHome: toggleHome);
      }else {
       return FidgetCubeInterface(toggleHome: toggleHome);
      }
    }
  }