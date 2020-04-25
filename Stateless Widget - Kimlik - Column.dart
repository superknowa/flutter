import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'İlk Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: <Widget>[
              Kimlik("Hakan","Turşu",40),
              Kimlik("Oğuz","Hızlı",30),
              Kimlik("Namık","Uçar",20),
            ],
          )),
    );
  }
}

class Kimlik extends StatelessWidget {
  final String isim;
  final String soyad;
  final int yas;

  Kimlik(this.isim, this.soyad, this.yas);

  @override
  Widget build(BuildContext context) {
    return Text("İsim: $isim Soyad: $soyad Yaş: $yas");
  }
}
