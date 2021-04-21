import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Months()));

class Months extends StatefulWidget {
  @override
  _MonthsState createState() => _MonthsState();
}

class _MonthsState extends State<Months> {
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('ListView'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: months.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                '${months[index]}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[850],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
