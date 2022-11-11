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
  bool isButtonDisabled = false;

  TextEditingController metinKutusu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar( ),
          body: Container(
            child: TextField(
              controller: metinKutusu,
              enabled: false,
              obscureText: false,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ));
  }
 
}
