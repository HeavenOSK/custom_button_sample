import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        onTap: () {
          _incrementCounter();
        },
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({
    this.onTap,
    Key key,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() {
          _pressing = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressing = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: AnimatedOpacity(
          opacity: _pressing ? 0.4 : 1,
          duration: Duration(milliseconds: 160),
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
