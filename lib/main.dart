import 'package:fast_relief/screens/authenticate/authenticate.dart';
import 'package:fast_relief/screens/home/home.dart';
import 'package:fast_relief/screens/wrapper.dart';
import 'package:fast_relief/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fast_relief/models/flutterUser.dart';
import 'package:provider/provider.dart';

//void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FlutterUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

