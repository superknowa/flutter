import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Mesaj(),
    );
  }
}

class Mesaj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Yeni()
    );
  }
}

class Yeni extends StatelessWidget {
  const Yeni({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: (){

      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Merhaba",style: TextStyle(color: Colors.red),)));

    },child: Text("Mesaj At"),);
  }
}
