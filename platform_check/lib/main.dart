import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  bool _switchValue = false;

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform check',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Platform check'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(Platform.isIOS ? "iOS" : "Android", style: TextStyle(fontSize: 30.0),),
              Platform.isIOS ? CupertinoSwitch(value: _switchValue, onChanged: _setSwitchValue) : Switch(value: _switchValue, onChanged: _setSwitchValue)
            ],
          ),
        ),
      ),
    );
  }
}
