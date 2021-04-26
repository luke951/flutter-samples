import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: TableExample()));

class TableExample extends StatefulWidget {
  @override
  _TableState createState() => _TableState();
}

class _TableState extends State<TableExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Table example'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 2),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Technology', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Score', style: TextStyle(fontSize: 20.0))
                    ]),
                    Column(children: [
                      Text('Review', style: TextStyle(fontSize: 20.0))
                    ]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Java')]),
                    Column(children: [Text('12')]),
                    Column(children: [Text('2')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Dart')]),
                    Column(children: [Text('15')]),
                    Column(children: [Text('5')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('C#')]),
                    Column(children: [Text('10')]),
                    Column(children: [Text('5')]),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
