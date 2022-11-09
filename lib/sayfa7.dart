import 'package:flutter/material.dart';
import 'dosya4.dart';

class sayfa6 extends StatefulWidget {
  const sayfa6({super.key});

  @override
  State<sayfa6> createState() => _sayfa6State();
}

void main() {
  runApp(sayfa6());
}

class _sayfa6State extends State<sayfa6> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: Icon(
          (Icons.ac_unit),
        )),
        drawer: Drawer(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(
                  Icons.directions_transit,
                ),
                title: Text('Car'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.flight),
                title: Text('Flight'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.train),
                title: Text('Train'),
                trailing: Icon(Icons.more_vert)
                /*    ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, "/dosya4");
                })
                */
                ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
