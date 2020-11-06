import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Serhii Velihonenko',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _randomBackgroundColor = Colors.white;
  static const colorRGBSize = 255;
  static const colorBrightness = 255;
  static const fontSize = 45.0;

  void setRandomBackgroundColor() {
    setState(() {
      _randomBackgroundColor = randomizeColor();
    });
  }

  Color randomizeColor() {
    Random random = new Random();
    return Color.fromARGB(colorBrightness, random.nextInt(colorRGBSize),
        random.nextInt(colorRGBSize), random.nextInt(colorRGBSize));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('randomBackgroundColor'),
        backgroundColor: _randomBackgroundColor,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
                child: Text(
              'Hey there',
              style: TextStyle(fontSize: fontSize),
            )),
            GestureDetector(
              onTap: setRandomBackgroundColor,
            )
          ],
        ));
  }
}
