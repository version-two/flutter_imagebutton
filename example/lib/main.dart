import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:imagebutton/imagebutton.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ImageButton example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Simple imageButton with just the image"),
              SizedBox(
                height: 5,
              ),
              ImageButton(
                children: <Widget>[],
                width: 91,
                height: 36,
                paddingTop: 5,
                pressedImage: Image.asset(
                  "assets/pressed.png",
                ),
                unpressedImage: Image.asset("assets/normal.png"),
                onTap: () {
                  print('test');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("Simple imageButton with image and text content"),
              SizedBox(
                height: 5,
              ),
              ImageButton(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'AHOJ A',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                width: 91,
                height: 36,
                paddingTop: 5,
                pressedImage: Image.asset(
                  "assets/pressed_notext.png",
                ),
                unpressedImage: Image.asset("assets/normal_notext.png"),
                onTap: () {
                  print('test2');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
