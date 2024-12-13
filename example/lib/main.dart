import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ImageButton Example'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      const Text(
                        "Simple ImageButton",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ImageButton(
                        pressOffset: 5,
                        width: 91,
                        height: 36,
                        pressedImage: Image.asset("assets/pressed.png"),
                        unpressedImage: Image.asset("assets/normal.png"),
                        onTap: () {
                          debugPrint('Simple button pressed');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      const Text(
                        "ImageButton with Icon and Text",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ImageButton(
                        pressOffset: 6,
                        padding: const EdgeInsets.only(bottom: 6),
                        width: 120,
                        height: 50,
                        loadingColor: Colors.white,
                        isLoading: false,
                        pressedImage: Image.asset("assets/pressed_notext.png"),
                        unpressedImage: Image.asset("assets/normal_notext.png"),
                        onTap: () {
                          debugPrint('Button with icon and text pressed');
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Like',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
