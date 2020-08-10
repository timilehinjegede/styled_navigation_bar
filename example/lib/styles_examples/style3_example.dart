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
      bottomNavigationBar: BottomNavStyle3(
        currentIndex: index,
        indicatorColor: Colors.blue,
        duration: Duration(milliseconds: 200),
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          Style3NavItem(
              activeIcon: Icon(Icons.home, color: Colors.blue),
              inactiveIcon: Icon(Icons.home, color: Colors.grey)),
          Style3NavItem(
              activeIcon: Icon(Icons.access_alarm, color: Colors.blue),
              inactiveIcon: Icon(Icons.access_alarm, color: Colors.grey)),
          Style3NavItem(
              activeIcon: Icon(Icons.message, color: Colors.blue),
              inactiveIcon: Icon(Icons.message, color: Colors.grey)),
          Style3NavItem(
              activeIcon: Icon(Icons.info, color: Colors.blue),
              inactiveIcon: Icon(Icons.info, color: Colors.grey)),
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
