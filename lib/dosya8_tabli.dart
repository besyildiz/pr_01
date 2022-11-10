import 'package:flutter/material.dart';

void main() => runApp(MyApp());

TextEditingController sayi5 = TextEditingController();
TextEditingController sayi4 = TextEditingController();
TextEditingController sayi3 = TextEditingController();
TextEditingController sayi2 = TextEditingController();
TextEditingController sayi1 = TextEditingController();

String tmpVariable = "";
bool isSwitched = false;
bool buttonPasif = true;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.android),
                text: "Tab 1",
              ),
              Tab(icon: Icon(Icons.phone_iphone), text: "Tab 2"),
              Tab(icon: Icon(Icons.phone_iphone), text: "Tab 3"),
              Tab(icon: Icon(Icons.phone_forwarded_sharp), text: "Tab 4"),
            ],
          ),
          title: Text('TutorialKart - TabBar & TabBarView'),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                TextField(
                  controller: sayi1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "1. sayıyı giriniz"),
                ),
                TextButton(
                    onPressed: () {
                      tmpVariable = sayi1.text;
                      sayi1.text = "";

                      final snackbar = SnackBar(
                          content: const Text("Ben snackbarım"),
                          backgroundColor: (Colors.black12),
                          action: SnackBarAction(
                            label: "Geri al",
                            onPressed: () {
                              sayi1.text = tmpVariable;
                            },
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    child: Text(
                      "1. kutuyu sil",
                      style: TextStyle(backgroundColor: Colors.black12),
                    )),
                TextField(
                  controller: sayi2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "2. sayıyı giriniz"),
                ),
                ElevatedButton(
                    onPressed: buttonPasif
                        ? () {
                            setState(() {
                              String a, b;
                              a = sayi1.text;
                              b = sayi2.text;

                              sayi1.text = b;
                              sayi2.text = a;
                            });
                          }
                        : null,
                    child: buttonPasif
                        ? Text(
                            "Yer değiştir",
                            style: TextStyle(backgroundColor: Colors.amber),
                          )
                        : Text(
                            "Yer değiştir 2",
                            style:
                                TextStyle(backgroundColor: Colors.lightGreen),
                          )),
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        if (isSwitched == true)
                          buttonPasif = false;
                        else
                          buttonPasif = true;
                        print(isSwitched);
                      });
                    })
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: sayi3,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "3. sayıyı giriniz"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (isNumeric(sayi3.text))
                        mesajVer("Sayısaldır", true);
                      else
                        mesajVer("Sayısal değildir", false);
                    },
                    child: Text(
                      "Sayı mı değil mi?",
                      style: TextStyle(backgroundColor: Colors.amber),
                    )),
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: sayi4,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "4. sayıyı giriniz"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: sayi5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "5. sayıyı giriniz"),
                ),
                ElevatedButton(
                    onPressed: () {
                      String mesaj;

                      if (isNumeric(sayi4.text) && isNumeric(sayi5.text))
                        mesajVer("Doğru giriş", true);
                      else
                        mesajVer("Yanlış değer", false);
                    },
                    child: Text("Sayı kontrolü")),
              ],
            ),
            Center(
              child: Text("Page 1"),
            ),
          ],
        ),
      ),
    );
  }

  void mesajVer(String value, bool durum) {
    final snackbar2 = SnackBar(
        content: Text(value),
        backgroundColor: (durum ? Colors.orange : Colors.deepPurpleAccent),
        action: SnackBarAction(
          label: "Geri al",
          onPressed: () {
            sayi1.text = tmpVariable;
          },
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar2);
  }

  bool isNumeric(value) {
    if (int.tryParse(value) == null)
      return false;
    else
      return true;
  }
}
