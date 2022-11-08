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
  TextEditingController sayi1Controller = TextEditingController();
  TextEditingController sayi2Controller = TextEditingController();
  TextEditingController sonucController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: fonk_toplam,
          ),
          title: (TextField(
            controller: metinKutusu,
          )),
        ),
        body: Column(
          children: [
            Container(
              child: TextField(
                controller: sayi1Controller,
                enabled: true,
                obscureText: false,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            Container(
              child: TextField(
                controller: sayi2Controller,
                enabled: true,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: fonk_toplam,
              child: Text("Topla"),
            ),
            Visibility(
              child: Container(
                child: TextField(
                  controller: sonucController,
                  enabled: true,
                  obscureText: false,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              visible: false,
            )
          ],
        ),
      ),
    );
  }

  void fonk_toplam() {
    int t = 15 + 5;
    //sayi2Controller.text = "$t";
    sonucController.text =
        (int.parse(sayi1Controller.text) + int.parse(sayi2Controller.text))
            .toString();
    setState(() {});
    metinKutusu.text = sonucController.text;
  }
}
