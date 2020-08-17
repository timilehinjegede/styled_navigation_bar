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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  int index = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              'You have pushed the button this many times:',
            ),
            Text(
              '$index',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavStyle5(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          Style5NavItem(
            activeIcon: Icon(Icons.home, color: Colors.white),
            inactiveIcon: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Style5NavItem(
            activeIcon: Icon(Icons.accessibility, color: Colors.white),
            inactiveIcon: Icon(Icons.accessibility, color: Colors.white),
            title: Text(
              'Second',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Style5NavItem(
            activeIcon: Icon(Icons.home, color: Colors.white),
            inactiveIcon: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Third mhen',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Style5NavItem(
            activeIcon: Icon(Icons.home, color: Colors.white),
            inactiveIcon: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Fourth',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
