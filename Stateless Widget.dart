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
        body: Center(child: Yazi("Profil"))
      ),
    );
  }
}

class Yazi extends StatelessWidget {

  final String icerik;

  Yazi(this.icerik);

  @override
  Widget build(BuildContext context) {
    return Text(
      icerik
    );
  }
}

