import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

  void decrement() {
    value -= 1;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider counter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider counter'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Consumer<Counter>(
                    builder: (context, counter, child) => Text(
                      '${counter.value}',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          var counter = context.read<Counter>();
                          counter.increment();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          var counter = context.read<Counter>();
                          counter.decrement();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}