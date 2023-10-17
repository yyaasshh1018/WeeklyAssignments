import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.title});

  final String title;

  @override
  State<BottomNavBar> createState() => _BottomNavbar();
}

class _BottomNavbar extends State<BottomNavBar> {
  int currentpageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: IndexedStack(
          index: currentpageindex,
          children: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Home")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Profile")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Settings")],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentpageindex = index;
          });
        },
        indicatorColor: const Color.fromARGB(255, 121, 213, 255),
        selectedIndex: currentpageindex,
        destinations: const <Widget>[
          NavigationDestination(
              selectedIcon: Icon(Icons.house),
              icon: Icon(Icons.house_outlined),
              label: "Home"),
          NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: "Profile"),
          NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: "Settings"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
