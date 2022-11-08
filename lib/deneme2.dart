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
        appBar: AppBar(
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            Icon(Icons.link)
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 120,
              ),
              Container(
                height: 350,
                width: 200,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text('Merhaba'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
