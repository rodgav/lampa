import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  void initTimer() async {
    _timer = new Timer(const Duration(seconds: 5), () {
      Navigator.of(context)?.pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    initTimer();
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
          Text(
            'Bienvenidos a',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            'La Ciudad Rosada de',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            'Lampa',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Container(),
          ),
          Image.asset('assets/images/logo.png'),
          Flexible(
            child: Container(),
          ),
          Text(
            'Realizado por:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            'MEDALY TAPIA MAMANI',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
          )
        ],
      ),
    );
  }
}
