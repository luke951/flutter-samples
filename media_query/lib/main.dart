import 'package:flutter/material.dart';

void main() => runApp(MediaQuery(data: MediaQueryData(), child: MaterialApp(home: MyApp())));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Media query'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        color: Color(0xFF092f42),
        child: Center(
          child: Text(
            'Widget\n\n' +
                'MediaQuery width: ${screenSize.width.toStringAsFixed(2)}\n\n' +
                'MediaQuery orientation: $orientation',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}