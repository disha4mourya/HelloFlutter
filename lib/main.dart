import 'package:flutter/material.dart';
import 'package:my_flutter/placeholder_widget.dart';
void main() {
  runApp(new MaterialApp(
    // Title
      title: "Using Tabs",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> {
  // Create a tab controller
  // TabController controller;
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey),
    PlaceholderWidget(Colors.grey)
  ];

  /* @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }*/

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Using Bottom Navigation Bar"),
        // Set the background color of the App Bar
        // backgroundColor: Colors.blue,
      ),

      body: _children[_currentIndex], // new

      // Set the TabBar view as the body of the Scaffold
      /* body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab(),new FirstTab()],
        // set the controller
        controller: controller,
      ),*/
      // Set the bottom navigation bar
      /*bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.adb),
            ),
            new Tab(
              icon: new Icon(Icons.airport_shuttle),
            ),
            new Tab(
              icon: new Icon(Icons.language),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),*/

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.redAccent,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          //currentIndex: 0, // this will be set when a new tab is tapped
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
