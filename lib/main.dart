import 'package:efie_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:efie_app/screens/splashscreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.red ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}

