import 'package:flutter/material.dart';

class RailNavBar extends StatefulWidget {
  const RailNavBar({super.key, required this.title});

  final String title;

  @override
  State<RailNavBar> createState() => _RailNavBar();
}

class _RailNavBar extends State<RailNavBar> {
  int currentpageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Row(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: [
            NavigationRail(
              groupAlignment: -1.0,
              onDestinationSelected: (int index) {
                setState(() {
                  currentpageindex = index;
                });
              },
              indicatorColor: const Color.fromARGB(255, 121, 213, 255),
              selectedIndex: currentpageindex,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                    selectedIcon: Icon(Icons.favorite),
                    icon: Icon(Icons.favorite_border),
                    label: Text("Favorite")),
                NavigationRailDestination(
                    selectedIcon: Icon(Icons.bookmark_sharp),
                    icon: Icon(Icons.bookmark_border_sharp),
                    label: Text("Bookmark")),
                NavigationRailDestination(
                    selectedIcon: Icon(Icons.star),
                    icon: Icon(Icons.star_border),
                    label: Text("Star")),
              ],
            ),
            IndexedStack(
              index: currentpageindex,
              children: const <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Favorite")],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Bookmark")],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Star")],
                ),
              ],
            ),
          ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
