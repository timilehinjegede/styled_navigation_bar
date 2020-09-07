import 'package:flutter/material.dart';
import 'package:stylednavigationbar/stylednavigationbar.dart';

class Style7Example extends StatefulWidget {
  Style7Example({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Style7ExampleState createState() => _Style7ExampleState();
}

class _Style7ExampleState extends State<Style7Example> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen ${_index + 1}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Style7BottomNav(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          Style7Item(
            icon: Icon(
              Icons.school,
            ),
            text: Text(
              'School',
            ),
          ),
          Style7Item(
            icon: Icon(
              Icons.business,
            ),
            text: Text(
              'Business',
            ),
          ),
          Style7Item(
            icon: Icon(
              Icons.home,
            ),
            text: Text(
              'Home',
            ),
          ),
          Style7Item(
            icon: Icon(
              Icons.score,
            ),
            text: Text(
              'Score',
            ),
          ),
        ],
      ),
    );
  }
}
