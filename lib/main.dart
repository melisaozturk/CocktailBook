import 'package:flutter/material.dart';
import 'package:flutter_projem/home.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     return const CupertinoApp(
      title: 'Team Kraken',
      home: HomeScreen(),
    );

  }
}