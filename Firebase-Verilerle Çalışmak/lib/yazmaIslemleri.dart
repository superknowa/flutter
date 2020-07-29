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

  kullaniciEkle(){
    db.collection("kullanıcılar").add({
      "isim":"Hakan",
      "soyad":"Demir",
      "mail":"hdemir@mailim.com"
    }).then((makbuz) => print(makbuz.documentID)).catchError((hata){print("Kullanıcı eklenemedi: $hata");});
  }

  kimlikIleKullaniciEkle(){
    db.collection("kullanıcılar").document("abc").setData({
      "isim":"Hakan",
      "soyad":"Demir",
      "mail":"hdemir@mailim.com"
    }).then((_) => print("Döküman girildi.")).catchError((hata){print("Kullanıcı eklenemedi: $hata");});
  }

  kullaniciGuncelle(){
    db.collection("kullanıcılar").document("abc").updateData({
      "isim":"Zeynep",
      "soyad":"Tunç",
      "mail":"ztunc@mailim.com"
    }).then((_) => print("Döküman güncellendi.")).catchError((hata){print("Hata oluştu: $hata");});
  }

  kullaniciSil(){
    db.collection("kullanıcılar").document("abc").delete().then((_) => print("Döküman silindi.")).catchError((hata){print("Hata oluştu: $hata");});
  }


  @override
  void initState() { 
    super.initState();
    kullaniciSil();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection("kullanıcılar").snapshots(),
        builder: (context,snapshot){

          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }

          List<Kullanici> kullanicilar = snapshot.data.documents.map((doc) => Kullanici.dokumandanUret(doc)).toList();

          return ListView.builder(
            itemCount: kullanicilar.length,
            itemBuilder: (context,pozisyon){
              return ListTile(
                title: Text(kullanicilar[pozisyon].isim),
                subtitle: Text(kullanicilar[pozisyon].eposta),
              );
            }
            );

        }
        )
    );
  }
}


