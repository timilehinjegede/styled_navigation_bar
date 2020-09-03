import 'package:flutter/material.dart';
import 'package:stylednavigationbar/stylednavigationbar.dart';

class Style4Example extends StatefulWidget {
  Style4Example({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Style4ExampleState createState() => _Style4ExampleState();
}

class _Style4ExampleState extends State<Style4Example> {
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
      bottomNavigationBar: Style4BottomNav(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          Style4Item(
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            inactiveIcon: Icon(
              Icons.dashboard,
              color: Colors.blue,
            ),
          ),
          Style4Item(
            activeIcon: Icon(
              Icons.business,
              color: Colors.red,
            ),
            inactiveIcon: Icon(
              Icons.business_center,
              color: Colors.blue,
            ),
          ),
          Style4Item(
            activeIcon: Icon(
              Icons.school,
              color: Colors.red,
            ),
            inactiveIcon: Icon(
              Icons.book,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
