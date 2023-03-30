//import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:pract/main.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellow,

        child: Center(
          child: Container(
            width: 300,
            height: 300,
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(seconds: 2),
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
      ),

    );
  }
}