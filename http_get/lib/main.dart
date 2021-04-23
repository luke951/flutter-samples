import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  Map _countries = new Map();
  void _getCountries() async {
    var url = Uri.parse('http://country.io/names.json');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print('Loaded ${_countries.length} countries');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP GET example"),
        backgroundColor: Colors.red,
      ),
      body: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32.0),
          child: Center(
              child: Column(
            children: <Widget>[
              Text('Countries',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
              Expanded(
                child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    return Row(children: <Widget>[
                      Flexible(
                        child:
                            Text('${key} : ', style: TextStyle(fontSize: 30.0)),
                      ),
                      Flexible(
                        child: Text(_countries[key],
                            style: TextStyle(fontSize: 30.0)),
                      )
                    ]);
                  },
                ),
              )
            ],
          ))),
    );
  }

  @override
  void initState() {
    _getCountries();
  }
}
