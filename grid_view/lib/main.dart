import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Grid()));

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  final List<String> cities = [
    "Berlin",
    "Madrid",
    "Rome",
    "Bucharest",
    "Paris",
    "Vienna",
    "Hamburg",
    "Warsaw",
    "Budapest",
    "Barcelona",
    "Munich",
    "Prague"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Grid View'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(4.0),
        children: cities.map((item) {
          return Card(
            child: Center(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[850],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
