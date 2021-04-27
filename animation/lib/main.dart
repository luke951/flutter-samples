import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation colorAnimation;
  Animation sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    colorAnimation =
        ColorTween(begin: Colors.greenAccent, end: Colors.green[900])
            .animate(controller);
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation example"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          height: sizeAnimation.value,
          width: sizeAnimation.value,
          color: colorAnimation.value,
        ),
      ),
    );
  }
}
