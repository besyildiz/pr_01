import 'package:flutter/material.dart';

void main() {
  runApp(const drawerDenemem());
}

class drawerDenemem extends StatefulWidget {
  const drawerDenemem({super.key});

  @override
  State<drawerDenemem> createState() => _drawerDenememState();
}

class _drawerDenememState extends State<drawerDenemem> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Selam"),
          ),
          body: Container(
            child: const TextField(
              enabled: true,
              obscureText: false,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          drawer: Drawer(
            child: Column(children: [
              Icon(Icons.abc_sharp),
              Icon(Icons.access_time_filled_rounded),
              Icon(Icons.accessibility_new_outlined),
              Icon(Icons.fire_extinguisher)
            ]),
          )),
    );
  }
}
