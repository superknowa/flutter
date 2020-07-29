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


  void kullanicilariGetir() async {

    var snapshot = await db.collection("kullanıcılar").getDocuments();
    snapshot.documents.forEach((doc) { 
      print(doc.data);
    });
      

  }

  void kimlikIleKullaniciGetir() async {

    var doc = await db.collection("kullanıcılar").document("dsfdsfs").get();
    
    if(doc.exists){
      print(doc.data);
    } else {
      print("Böyle bir döküman bulunmuyor.");
    }
      

  }

  void kullanicilariSirala() async {

    var snapshot = await db.collection("kullanıcılar").orderBy("yaş", descending: true).getDocuments();
    snapshot.documents.forEach((doc) { 
      print(doc.data);
    });
      

  }

  void kullaniciSorgula() async {

    var snapshot = await db.collection("kullanıcılar").where("yaş", isLessThanOrEqualTo: 60).getDocuments();
    snapshot.documents.forEach((doc) { 
      print(doc.data);
    });
      

  }

  void kullaniciCokluSorgu() async {

    QuerySnapshot snapshot = await db.collection("kullanıcılar").where("soyad", isEqualTo: "Kurt").where("yaş", isGreaterThan: 20).limit(1).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) { 
      print(doc.data);
    });
      

  }

  void kullaniciOlustur() async {
    var doc = await db.collection("kullanıcılar").document("80o7t8ebMg4QMBsTHRF5").get();

    Kullanici kullanici_1 = Kullanici.dokumandanUret(doc);

    print(kullanici_1.id);
    print(kullanici_1.isim);
    print(kullanici_1.soyad);
    print(kullanici_1.eposta);
    print(kullanici_1.avatar);
  }

  @override
  void initState() { 
    super.initState();
    kullaniciOlustur();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}


