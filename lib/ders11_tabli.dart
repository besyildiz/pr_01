import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController sayi1Controller = TextEditingController();
  TextEditingController sayi2Controller = TextEditingController();
  TextEditingController sayi3Controller = TextEditingController();
  TextEditingController sayi4Controller = TextEditingController();
  TextEditingController sayi5Controller = TextEditingController();
  String tmp_variable1 = "";
  String tmp_variable2 = "";
  bool isSwitched = true;
  bool butonAktif = true;

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: Text('Tabs Demo'),
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color:
                        Colors.greenAccent), //Change background color from here
                isScrollable: true,
                tabs: [
                  Tab(child: Text('Flight')),
                  Tab(child: Text('Train')),
                  Tab(child: Text('sayıları topla')),
                  Tab(child: Text('Cycle')),
                  Tab(child: Text('Boat')),
                  Tab(child: Text('Boat')),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                TextField(
                  controller: sayi1Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '1. Sayıyı Giriniz:',
                  ),
                ),
                TextButton(
                    onPressed: () {
                      sayi1Controller.text = "";
                      sayi2Controller.text = "";
                      tmp_variable1 = sayi1Controller.text;
                      tmp_variable2 = sayi2Controller.text;

                      final snackBar = SnackBar(
                        content: const Text('Verileri sildiniz'),
                        backgroundColor: (Colors.black12),
                        action: SnackBarAction(
                          label: 'Geri Al',
                          onPressed: () {
                            sayi1Controller.text = tmp_variable1;
                            sayi2Controller.text = tmp_variable2;
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text("1. Girişi sil",
                        style: TextStyle(
                            backgroundColor: Colors.orange,
                            color: Colors.blueAccent,
                            fontSize: 30))),
                TextField(
                  controller: sayi2Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '2. Sayıyı giriniz:',
                  ),
                ),
                ElevatedButton(
                    onPressed: butonAktif
                        ? () {
                            int tmp = int.parse(sayi1Controller.text);
                            sayi1Controller.text = sayi2Controller.text;
                            sayi2Controller.text = tmp.toString();
                          }
                        : null,
                    child: butonAktif
                        ? Text(
                            "Yer Değiştir",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text("HAyır", style: TextStyle(color: Colors.red))),
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        if (isSwitched == true)
                          butonAktif = true;
                        else
                          butonAktif = false;
                      });
                    }),
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: sayi3Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '1. Sayıyı Giriniz:',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      //print ("Dönen değer:"+isNumeric(sayi3Controller.text).toString());
                      if (isNumeric(sayi3Controller.text) == false)
                        mesajVer(
                            "Hatalı giriş", isNumeric(sayi3Controller.text));
                      else
                        mesajVer(
                            "Doğru giriş", isNumeric(sayi3Controller.text));
                    },
                    child: Text("Sayıları Topla"))
              ],
            ),
            Column(
              children: [
                TextField(
                  controller: sayi4Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '1. Sayıyı Giriniz:',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: sayi5Controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '2. Sayıyı Giriniz:',
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      String mesaj = "";
                      if (isNumeric(sayi4Controller.text) == true &&
                          isNumeric(sayi5Controller.text) == true)
                        mesaj = "Doğru giriş";
                      else
                        mesaj = "Yanlış giriş";

                      mesajVer(
                          mesaj,
                          (isNumeric(sayi4Controller.text) &&
                              isNumeric(sayi5Controller.text)));
                    },
                    child: Text("sayı kontrol"))
              ],
            ),
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item: $index'),
                  tileColor:
                      selectedIndex == index ? Colors.blue : Colors.lightBlue,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                ListTile(title: Icon(Icons.battery_full)),
                ListTile(title: Icon(Icons.anchor)),
                ListTile(title: Icon(Icons.access_alarm)),
                ListTile(title: Icon(Icons.ballot))
              ],
            ),
          ],
        ),
      )),
    );
  }

  void mesajVer(mesaj, durum) {
    final snackBar3 = SnackBar(
      content: Text(mesaj.toString()),
      backgroundColor: (durum ? Colors.green : Colors.red),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar3);
  }
}

bool isNumeric(value) {
  if (int.tryParse(value) == null) {
    return false;
  } else
    return true;
}
