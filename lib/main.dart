import 'package:flutter/material.dart';

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
      theme: buildTheme(),
      home: buildHomePage(),
    );
  }
}

Widget buildHomePage() {
  return const MyHomePage(title: 'Flutter Demo Home Page');
}

ThemeData buildTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
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
  int _counter = 0;
  String platformVersion = 'Unknown';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSelect(String str) {
      return Row(
        children: <Widget>[
          Checkbox(
              value: false,
              onChanged: (bool? value) {
                print("value: $value");
              }),
          Text(str)
        ],
      );
    }

    getPlatformVersion() async {


    }

    Widget buildBody() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '选择下面的选项',
            style: TextStyle(fontSize: 20),
          ),
          buildSelect("apple"),
          buildSelect("banana"),
          buildSelect("orange"),
          buildSelect("pear"),
          Text(platformVersion),
          TextButton(
            onPressed: getPlatformVersion,
            child: const Text("获取平台信息"),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: buildBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
