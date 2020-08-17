import 'package:example/styles_examples/style1_example.dart';
import 'package:flutter/material.dart';
import 'package:stylednavigationbar/stylednavigationbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Style1Example(
        title: 'Style1 Example',
      ),
    );
  }
}
