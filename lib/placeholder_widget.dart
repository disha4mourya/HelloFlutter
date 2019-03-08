import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: color,
      body: new Container(
        child: new Center(
          child: new Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.favorite,
                size: 160.0,
                color: Colors.white,
              ),
              new GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return new Container(
                          color: Colors.transparent,
                          //could change this to Color(0xFF737373),
                          //so you don't have to change MaterialApp canvasColor
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(50.0),
                                    topRight: const Radius.circular(10.0))),
                            child: new Center(
                              child: new Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new ListTile(
                                    leading: new Icon(Icons.view_column),
                                    title: new Text('View Profile'),
                                    onTap: () => Navigator.pop(context),
                                  ),
                                  new ListTile(
                                    leading: new Icon(Icons.send),
                                    title: new Text('Send Request'),
                                    onTap: () => Navigator.pop(context),
                                  ),
                                  new ListTile(
                                    leading: new Icon(Icons.phone),
                                    title: new Text('Contact Details'),
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });

                  /*Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("Sending Message"),
              ));
              Navigator.pushNamed(context, "myRoute");*/
                },
                child: new Text("Click to see bottom sheet"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
