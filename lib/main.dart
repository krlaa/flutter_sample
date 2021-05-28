import 'package:flutter/material.dart';
import 'package:gitpodflutter/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gitpod',
      home: MyHomePage(),
    );
  }
}
