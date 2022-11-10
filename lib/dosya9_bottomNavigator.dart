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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
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
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Center(
                  child: Container(
                    color: Colors.greenAccent,
                    width: 100,
                    height: 100,
                    child: ListView(
                      children: [
                        Text(
                          "Metin 1",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Metin 2",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Metin 3",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ])),
        ));
  }
}
