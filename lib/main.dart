import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _controller = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage<bool>(
        title: 'Flutter Demo Home Page',
        controller: _controller,
      ),
    );
  }
}

class MyHomePage<T> extends StatefulWidget {
  const MyHomePage({
    required this.title,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final String title;
  final ValueNotifier<T> controller;

  @override
  _MyHomePageState createState() => _MyHomePageState<T>();
}

class _MyHomePageState<T> extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_incrementCounter);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_incrementCounter);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
