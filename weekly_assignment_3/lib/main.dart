import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void removeitem(int input) {
    setState(() {
      indexes.removeAt(input);
    });
  }

  List<String> indexes = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ];

  Color setColor() {
    int value = math.Random().nextInt(255);
    int change = math.Random().nextInt(255);
    Color randColor;
    if (value > 120) {
      randColor = Color.fromRGBO(
        value % change * 1,
        value % change * 2,
        value % change * 3,
        1.0,
      );
    } else {
      randColor = Color.fromRGBO(
        value % change * 3,
        value % change * 2,
        value % change * 1,
        1.0,
      );
    }

    return randColor;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: indexes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: Icon(
                Icons.circle,
                color: setColor(),
                size: 50.0,
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  removeitem(index);
                },
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(20),
                ),
                child: const Icon(Icons.delete),
              ),
              title: const Text("I am a ListTile"),
              subtitle: Text("Index: ${indexes[index]}"));
        },
        separatorBuilder: (context, index) => const Divider(),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
