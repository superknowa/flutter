import 'package:fcbefore/urunler.dart';
import 'package:fcbefore/sepetim.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uçarak Gelsin',
      home: AnaSayfa(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _aktifIcerikNo = 0;

  List _icerikler;

  @override
  void initState() {
    super.initState();

    _icerikler = [
      Urunler(),
      Sepetim(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red[400]),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Uçarak Gelsin",
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      body: _icerikler[_aktifIcerikNo],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Selçuk Mert"),
                accountEmail: Text("selm123@mailim.com"),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(50.0)),
                ),
                decoration: BoxDecoration(color: Colors.red[400])),
            ListTile(
              title: Text('Siparişlerim'),
              onTap: () {},
            ),
            ListTile(
              title: Text('İndirimlerim'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Ayarlar'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Çıkış Yap'),
              onTap: () {
                Navigator.pop(context); // Menuyu kapatır
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
              title: Text("Ürünler"), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text("Sepetim"), icon: Icon(Icons.shopping_cart)),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}
