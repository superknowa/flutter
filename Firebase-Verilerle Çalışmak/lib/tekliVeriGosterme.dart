import 'package:fireworks/models/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  final db = Firestore.instance;


  @override
  void initState() { 
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: db.collection("kullanıcılar").document("80o7t8ebMg4QMBsTHRF5").snapshots(),
        builder: (context,snapshot){

          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }

          Kullanici kullanici = Kullanici.dokumandanUret(snapshot.data);

          return ListTile(
            title: Text(kullanici.isim + " " + kullanici.soyad),
            subtitle: Text(kullanici.eposta),
            leading: Image.network(
              kullanici.avatar,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
              ),
          );
        }
        )
    );
  }
}


