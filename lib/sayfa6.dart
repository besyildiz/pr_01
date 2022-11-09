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
        body: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  child: ElevatedButton(
                    onPressed: isButtonDisabled ? null : _butonuPasifEt,
                    child: const Text('Pasif Et'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      isButtonDisabled = false;
                      setState(() {});
                    },
                    child: const Text('Aktif Et'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                Container(
                  child: ElevatedButton(
                    onPressed: isButtonDisabled ? null : _butonuPasifEt,
                    child: const Text('Pasif Et'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      isButtonDisabled = false;
                      setState(() {});
                    },
                    child: const Text('Aktif Et'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _butonuPasifEt() {
    isButtonDisabled = true;
    setState(() {});
  }
}
