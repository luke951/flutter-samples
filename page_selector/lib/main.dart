import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: PageSelector()));

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  static const _pageIcons = <Icon>[
    Icon(Icons.drafts),
    Icon(Icons.schedule),
    Icon(Icons.android),
    Icon(Icons.iso),
    Icon(Icons.location_pin),
    Icon(Icons.science_sharp),
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
      body: DefaultTabController(
        length: _pageIcons.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                const TabPageSelector(),
                Expanded(
                  child: IconTheme(
                    data: IconThemeData(
                      size: 128.0,
                      color: Theme.of(context).accentColor,
                    ),
                    child: const TabBarView(children: _pageIcons),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final TabController controller =
                        DefaultTabController.of(context);
                    if (!controller.indexIsChanging) {
                      controller.animateTo(_pageIcons.length - 1);
                    }
                  },
                  child: const Text('SKIP'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
