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

TextEditingController sayi1 = TextEditingController();
TextEditingController sayi3 = TextEditingController();
TextEditingController sayi2 = TextEditingController();
TextEditingController tcKimlik = TextEditingController();
bool isSwitched = true;
bool kutuPasif = true;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_alarm,
                color: Colors.white,
              ),
              onPressed: () {
                _islemYap();
              },
            )
          ],
        ),
        persistentFooterButtons: <Widget>[
          new IconButton(
              icon: new Icon(Icons.timer),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyWidget()));
              }),
          new IconButton(
              icon: new Icon(Icons.people),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => drawerDenemem()));
              }),
        ],
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
                      color: Colors
                          .greenAccent), //Change background color from here
                  isScrollable: true,
                  tabs: [
                    Tab(child: Text('Soru 1')),
                    Tab(child: Text('Soru 2')),
                    Tab(child: Text('Soru 3')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Column(children: [
                  ElevatedButton(
                      onPressed: () {
                        for (int i = 5; i <= 100; ++i) if (i % 2 == 0) print(i);
                      },
                      child: Text("Uygulama-1")),
                  ElevatedButton.icon(
                      onPressed: () {
                        for (int i = 1; i <= 10; i++) if (i % 3 == 0) print(i);
                      },
                      icon: Icon(Icons.add_a_photo),
                      label: Text("Uygulama-2"))
                ]),
              ),
              Column(
                children: [
                  TextField(
                    controller: tcKimlik,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "TC Kimlik"),
                    enabled: kutuPasif,
                  ),
                  Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          if (isSwitched == true)
                            kutuPasif = true;
                          else {
                            kutuPasif = false;
                            tcKimlik.text = "";
                          }
                          print(isSwitched);
                        });
                      }),
                  ElevatedButton(
                      onPressed: () {
                        bool durum = tcKontrol(tcKimlik.text);
                        if (!durum)
                          mesajVer("Hatalı giriş", false);
                        else
                          mesajVer("Doğru giriş", true);
                      },
                      child: Text("TC Kimlik Kontrol")),
                ],
              ),
              Column(
                children: [
                  TextField(
                    controller: sayi1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "1. sayıyı giriniz"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: sayi2,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "2. sayıyı giriniz"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    enabled: false,
                    controller: sayi3,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Sonuç"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool tcKontrol(value) {
    if (value.toString().length == 11 && int.tryParse(value) != null)
      return true;
    else
      return false;
  }

  void mesajVer(String value, bool durum) {
    final snackbar2 = SnackBar(
      content: Text(
        value,
        style: durum
            ? TextStyle(color: Colors.black)
            : TextStyle(color: Colors.white),
      ),
      backgroundColor: (durum ? Colors.green : Colors.red),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar2);
  }

  void _islemYap() {
    int a = int.parse((sayi1.text)), b = int.parse((sayi2.text)), c = 0;

    if (((a + b) % 10) == 0)
      c = (a + b) * 10;
    else
      c = (a + b) - 10;
    setState(() {
      sayi3.text = c.toString();
    });
  }
}

/////////////////
///
///
///
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

////////////////
////
///
///

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
            title: Text("Selam"),
          ),
          body: Container(
            child: TextField(
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
