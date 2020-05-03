import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(viewportFraction: 0.75);
  double height, width;
  double currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('---------------------------');

    height = MediaQuery.of(context).size.height * 0.65;
    width = MediaQuery.of(context).size.width * 0.85;
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: PageView.builder(
            controller: _pageController,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Transform(
                transform: (Matrix4.identity()..setEntry(3, 2, 0.002))
                  ..rotateY((currentPage - index).abs() * (pi / 2)),
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    width: width,
                    height: height,
                    // constraints: BoxConstraints.loose(Size(width, height)),
                    color: Colors.primaries[index % 17],
                    child: Text(
                      currentPage.toString(),
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
