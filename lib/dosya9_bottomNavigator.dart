import 'package:flutter/material.dart';

void main() {
  runApp(calismam1());
}

TextEditingController sayi3 = TextEditingController();
TextEditingController sayi2 = TextEditingController();
TextEditingController sayi1 = TextEditingController();

class calismam1 extends StatefulWidget {
  const calismam1({super.key});

  @override
  State<calismam1> createState() => _calismam1State();
}

class _calismam1State extends State<calismam1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('BottomNavigationBar Demo'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Calls',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
            ],
          ),
          body: Column(children: [
            TextField(
              controller: sayi1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "1. sayıyı giriniz"),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sayı mı değil mi?",
                  style: TextStyle(backgroundColor: Colors.amber),
                )),
          ]),
        ));
  }
}
