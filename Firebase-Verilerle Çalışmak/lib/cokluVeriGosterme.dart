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

  Future<List<Kullanici>> kullanicilariGetir() async {

    QuerySnapshot snapshot = await db.collection("kullanıcılar").getDocuments();
    List<Kullanici> kullanicilar = snapshot.documents.map((doc) => Kullanici.dokumandanUret(doc)).toList();
    return kullanicilar;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Kullanici>>(
        future: kullanicilariGetir(),
        builder: (context,snapshot){

          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context,pozisyon){
              return ListTile(
                title: Text(snapshot.data[pozisyon].isim),
                subtitle: Text(snapshot.data[pozisyon].eposta),
              );
            }
            );

        }
        )
    );
  }
}


