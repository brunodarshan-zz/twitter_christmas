import 'package:flutter/material.dart';
import 'package:twitter_christmas/database_instance.dart';
import 'package:twitter_christmas/twitter_app.dart';

void main() => DatabaseInstance.initDB().then(
  (database) {
    runApp(MyApp());
  });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Christmas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwitterApp(title: "Twitter"),
    );
  }
}

