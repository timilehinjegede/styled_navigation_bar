import 'package:flutter/material.dart';
import 'package:stylednavigationbar/stylednavigationbar.dart';

class Style1Example extends StatefulWidget {
  Style1Example({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Style1ExampleState createState() => _Style1ExampleState();
}

class _Style1ExampleState extends State<Style1Example> {
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
      bottomNavigationBar: RoundedBottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        navBarDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(
              30,
            ),
          ),
        ),
        indicatorRadius: 23,
        items: [
          RoundedBottomNavItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            inactiveIcon: Icon(
              Icons.dashboard,
              color: Colors.blue,
            ),
          ),
          RoundedBottomNavItem(
            activeIcon: Icon(
              Icons.business,
              color: Colors.white,
            ),
            inactiveIcon: Icon(
              Icons.business_center,
              color: Colors.blue,
            ),
          ),
          RoundedBottomNavItem(
            activeIcon: Icon(
              Icons.school,
              color: Colors.white,
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
