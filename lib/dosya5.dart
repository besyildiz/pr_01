import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Row(
          children: <Widget>[
            const SizedBox(width: 90),
            Column(
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: Text("Tamam 1")),
                ElevatedButton(onPressed: () {}, child: Text("Tamam 2")),
              ],
            ),
            const SizedBox(
              width: 90,
            ),
            Column(
              children: <Widget>[
                ElevatedButton(onPressed: () {}, child: Text("Tamam 3")),
                ElevatedButton(onPressed: () {}, child: Text("Tamam 4")),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
