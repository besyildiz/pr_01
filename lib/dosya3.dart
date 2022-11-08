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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: toplam,
            ),
          ),
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

  void _butonuPasifEt() {
    isButtonDisabled = true;
    setState(() {});
  }

  void toplam() {
    int t = 15 + 5;
    metinKutusu.text = "$t";
    print("$t");
    setState(() {});
  }
}
