import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: CustomFont()));

class CustomFont extends StatefulWidget {
  @override
  _CustomFontState createState() => _CustomFontState();
}

class _CustomFontState extends State<CustomFont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Custom font example'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: Center(
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Bangers',
                fontWeight: FontWeight.w400,
                fontSize: 36.0),
          ),
        ),
      ),
    );
  }
}
