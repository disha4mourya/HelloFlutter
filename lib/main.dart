import 'package:flutter/material.dart';
import 'package:my_flutter/ui/placeholder_widget.dart';
import 'package:my_flutter/utils/AppConstant.dart';
void main() {
  runApp(new MaterialApp(
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey)
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(AppConstant.appTitle),
      ),

      body: _children[_currentIndex], // new

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.redAccent,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: new BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,

          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Messages'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Messages'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile'))
          ],
        ),
      ),
    );
  }
}
