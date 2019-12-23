import 'dart:math';

import 'package:christmas_tree/widgets/custom_widgets.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController _controllerTopCenter;
  var _clickCount = -1;
  final textStyle = const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold);

  final merryXmas = "Merry X-Mas ❤︎";
  @override
  void initState() {
    _controllerTopCenter = ConfettiController(duration: Duration(seconds: 3));
    _controllerTopCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.red,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      merryXmas.substring(0, 5),
                      style: textStyle,
                    ),
                    getTop(),
                    getMiddle(110),
                    getMiddle(120),
                    getMiddle(130),
                    getBottom(),
                    Text(
                      merryXmas.substring(6, merryXmas.length),
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: getConfetti(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: getConfetti(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0, bottom: 30),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      _controllerTopCenter.play();
                      ErrorWidget.builder = (errorDetails) {
                        return Center(
                          child: Container(
                              width: 200,
                              height: 200,
                              color: Colors.red,
                              child: Wrap(
                                children: <Widget>[...getTexts()],
                              )),
                        );
                      };
                      setState(() {
                        if (_clickCount > merryXmas.length-1) {
                          _clickCount = 12;
                        } else {
                          _clickCount++;
                        }
                      });
                    },
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ConfettiWidget getConfetti() {
    return ConfettiWidget(
      confettiController: _controllerTopCenter,
      blastDirection: pi / 2,
      maxBlastForce: 3,
      minBlastForce: 2,
      emissionFrequency: 0.1,
      numberOfParticles: 5,
      colors: [Colors.green, Colors.red, Colors.redAccent, Colors.greenAccent, Colors.lightGreen, Colors.lightGreenAccent],
    );
  }

  Row getBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 140,
          height: 100,
          child: ErrorRect(),
        ),
        Container(
          width: 80,
          height: 100,
          color: Colors.brown,
        ),
        SizedBox(
          width: 140,
          height: 100,
          child: ErrorRect(),
        ),
      ],
    );
  }

  Row getMiddle(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          color: Colors.green,
          height: 100,
          child: ErrorTriangle(Direction.Left),
        ),
        Container(
          color: Colors.green,
          width: 60,
          height: 100,
        ),
        Container(
          width: width,
          color: Colors.green,
          height: 100,
          child: ErrorTriangle(Direction.Right),
        ),
      ],
    );
  }

  Row getTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.green,
          width: 100,
          height: 100,
          child: ErrorTriangle(Direction.Left),
        ),
        Container(
          color: Colors.green,
          width: 100,
          height: 100,
          child: ErrorTriangle(Direction.Right),
        ),
      ],
    );
  }

  List<Widget> getTexts() {
    List<Widget> list = List();
    for (var i = 0; i < 8; i++) {
      list.add(Text(
        merryXmas.substring(_clickCount, _clickCount + 1),
        style: TextStyle(color: Colors.white, fontSize: 60),
      ));
    }

    return list;
  }
}
