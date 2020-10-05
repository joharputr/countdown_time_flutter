import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:waktumundur/helperTimer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Countdown'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool disabledButton = false;
  bool showTimer = false;

  @override
  void initState() {
    super.initState();
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
            showTimer
                ? CountdownTimer(
                    endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 5,
                    onEnd: () {
                      setState(() {
                        showTimer = false;
                        disabledButton = false;
                        print('onEnd');
                      });
                    },
                  )
                : Container(),
            disabledButton
                ? FlatButton(
                    color: Colors.grey,
                    child: Text(
                      "BUTTON",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                : FlatButton(
                    color: Colors.red,
                    child: Text("BUTTON"),
                    onPressed: () {
                      setState(() {
                        disabledButton = true;
                        showTimer = true;
                        disabledButton ? null : print("GGPRINT");
                      });
                    },
                  )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
