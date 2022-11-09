import 'package:flutter/material.dart';

class calismam1 extends StatefulWidget {
  const calismam1({super.key});

  @override
  State<calismam1> createState() => _calismam1State();
}

class _calismam1State extends State<calismam1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Merhaba")),
      body: Container(
        child: Image.asset("assets/images/4.jpg"),
        height: 350,
        width: 200,
      ),
    ));
  }
}
