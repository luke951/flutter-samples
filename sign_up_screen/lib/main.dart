import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign up screen',
      theme: ThemeData(primaryColor: Colors.indigo),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign up screen'),
          elevation: 5.0,
        ),
        body: _buildContent(),
      ),
    );
  }
}

Widget _buildContent() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Text(
            'Sign up',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('images/google-logo.png'),
                  Text(
                    'Sign up with google',
                    style: TextStyle(color: Colors.black87, fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                primary: Colors.black12,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('images/facebook-logo.png'),
                  Text(
                    'Sign up with facebook',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF334D92),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                primary: Colors.black12,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xff4776E6), Color(0xff8E54E9)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                ),
                child: Container(
                  constraints: BoxConstraints(minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Sign up with email',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                primary: Colors.black12,
                padding: EdgeInsets.all(0.0),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 50.0,
            child: ElevatedButton (
              child: Text(
                'Go anonymous',
                style: TextStyle(color: Colors.black87, fontSize: 15.0),
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0))),
                backgroundColor: Colors.lime[300],
                primary: Colors.black12,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
