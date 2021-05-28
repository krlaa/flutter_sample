import 'package:flutter/material.dart';
import 'package:gitpodflutter/screens/home_page.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(
    enabled: true,
    defaultDevice: Devices.ios.iPhone11ProMax,
    style: DevicePreviewStyle(
        background: BoxDecoration(color: Colors.black),
        toolBar: DevicePreviewToolBarStyle.dark()),
    builder: (context) {
      return MyApp();
    }));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Example',
      home: MyHomePage(),
    );
  }
}
