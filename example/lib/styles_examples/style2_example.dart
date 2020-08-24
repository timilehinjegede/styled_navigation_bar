import 'package:flutter/material.dart';
import 'package:stylednavigationbar/stylednavigationbar.dart';

class Style2Example extends StatefulWidget {
  Style2Example({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Style2ExampleState createState() => _Style2ExampleState();
}

class _Style2ExampleState extends State<Style2Example> {
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
      bottomNavigationBar: Style2BottomNav(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          Style2Item(
            icon: Icon(
              Icons.school,
            ),
            text: Text(
              'School',
            ),
          ),
          Style2Item(
            icon: Icon(
              Icons.business,
            ),
            text: Text(
              'Business',
            ),
          ),
          Style2Item(
            icon: Icon(
              Icons.home,
            ),
            text: Text(
              'Home',
            ),
          ),
        ],
      ),
    );
  }
}
