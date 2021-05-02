import 'package:flutter/material.dart';
import '../store/global_state.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  GlobalState _store = GlobalState.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global state example'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Hello ${_store.get('name')}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
