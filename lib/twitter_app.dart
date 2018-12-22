import 'package:flutter/material.dart';

class TwitterApp extends StatefulWidget {
  TwitterApp({Key key, this.title,}) : super(key: key);
  final String title;

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<TwitterApp> {
  

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
        
          ],
        ),
      ),
      
    );
  }
}