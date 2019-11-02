import 'dart:async';

import 'package:efie_app/screens/home.dart';
import 'package:efie_app/screens/myHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
      Timer(Duration(seconds: 5), ()=> Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => IrentGH())));
      _iconAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000));

      _iconAnimation = CurvedAnimation(
          parent: _iconAnimationController, curve: ElasticInOutCurve());
      _iconAnimation.addListener(() => this.setState((){}));
      _iconAnimationController.forward();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50)),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(image: AssetImage('images/irent-new-1500.png'),
                      height: _iconAnimation.value * 300,),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text("Your Premium Rent Mall!", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  )
              ),
            ],
          )
        ],

      ),
    );
  }
}
