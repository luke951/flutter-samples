import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Navigation()));

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _bottomNavigationIndex = 0;
  int _tabBarIndex = 0;

  static List<Widget> _tabBarIcons = <Widget>[
    Icon(Icons.apartment_rounded, size: 72.0, color: Color(0xff46CDCF)),
    Icon(Icons.api_outlined, size: 72.0, color: Color(0xff46CDCF)),
    Icon(Icons.apps_outlined, size: 72.0, color: Color(0xff46CDCF)),
  ];

  static List<Widget> _bottomNavigationIcons = <Widget>[
    Icon(Icons.assignment_turned_in_rounded, size: 72.0, color: Color(0xff46CDCF)),
    Icon(Icons.attach_file_rounded, size: 72.0, color: Color(0xff46CDCF)),
    Icon(Icons.auto_awesome_mosaic, size: 72.0, color: Color(0xff46CDCF)),
  ];

  void _onBottomNavigationBarTap(int index) {
    setState(() {
      _bottomNavigationIndex = index;
      _tabBarIndex = 0;
    });
  }

  void _onTabBarTap(int index) {
    setState(() {
      _tabBarIndex = index + 1;
      _bottomNavigationIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _tabBar = TabBar(labelColor: Colors.blue,
      onTap: _onTabBarTap,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.apartment_rounded, color: Color(0xff46CDCF)), child: Text('Tab 1', style: TextStyle(color: Color(0xff46CDCF)))),
        Tab(icon: Icon(Icons.api_outlined, color: Color(0xff46CDCF)), child: Text('Tab 2', style: TextStyle(color: Color(0xff46CDCF)))),
        Tab(icon: Icon(Icons.apps_outlined, color: Color(0xff46CDCF)), child: Text('Tab 3', style: TextStyle(color: Color(0xff46CDCF)))),
      ],
    );

    return DefaultTabController(length: _tabBar.tabs.length, child: Scaffold(
      appBar: AppBar(
        bottom: _tabBar,
        centerTitle: true,
        backgroundColor: Color(0xff48466D),
        title: Text('Navigation'),
      ),

      //7
      body: Center(child:_tabBarIndex == 0 ?
      _bottomNavigationIcons.elementAt(_bottomNavigationIndex):
      _tabBarIcons.elementAt(_tabBarIndex - 1)),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onBottomNavigationBarTap,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in_rounded), label: 'Bar Item 1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_file_rounded), label: 'Bar Item 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_mosaic), label: 'Bar Item 3'),
        ],
        currentIndex: _bottomNavigationIndex,
      ),
    ));
  }
}