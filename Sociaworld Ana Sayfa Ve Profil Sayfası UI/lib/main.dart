import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sociaworld/gonderikarti.dart';
import 'package:sociaworld/profilsayfasi.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey,
              size: 32.0,
            ),
            onPressed: () {}),
        title: Text(
          "Sociaworld",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.purple[300],
                size: 32.0,
              ),
              onPressed: () {
                showModalBottomSheet(context: context, builder: (BuildContext context){
                  return Column(
                    children: <Widget>[
                      duyuru("Kamil seni takip etti","3 dk önce"),
                      duyuru("Seda gönderine yorum yaptı","1 gün önce"),
                      duyuru("Cüneyt mesaj gönderdi","2 hafta önce"),
                    ],
                  );
                });
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0),
            ]),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                profilKartiOlustur(
                  "Selçuk",
                  "https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_960_720.jpg",
                  "Selçuk Mert",
                  "https://cdn.pixabay.com/photo/2013/11/28/10/36/road-220058_960_720.jpg"
                ),
                profilKartiOlustur(
                  "Tom",
                  "https://cdn.pixabay.com/photo/2018/03/13/15/01/male-3222718_960_720.jpg",
                  "Tom Watson",
                  "https://cdn.pixabay.com/photo/2020/05/30/17/18/wind-power-plant-5239642_960_720.jpg"
                ),
                profilKartiOlustur(
                  "Jessica",
                  "https://cdn.pixabay.com/photo/2020/04/22/21/51/mannequin-5080215_960_720.jpg",
                  "Jessica Lopez",
                  "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_960_720.jpg"
                ),
                profilKartiOlustur(
                  "Belma",
                  "https://cdn.pixabay.com/photo/2018/01/21/14/16/woman-3096664_960_720.jpg",
                  "Belma Zorlu",
                  "https://cdn.pixabay.com/photo/2017/11/28/22/25/lapland-2984828_960_720.jpg"
                ),
                profilKartiOlustur(
                  "Yıldız",
                  "https://cdn.pixabay.com/photo/2017/03/02/20/25/woman-2112292_960_720.jpg",
                  "Yıldız Mars",
                  "https://cdn.pixabay.com/photo/2015/03/26/09/47/sky-690293_960_720.jpg"
                ),
                profilKartiOlustur(
                  "Nadir",
                  "https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_960_720.jpg",
                  "Nadir Çakıl",
                  "https://cdn.pixabay.com/photo/2016/11/06/05/36/landscape-1802337_960_720.jpg"
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GonderiKarti(
            isimSoyad: "Hakan Yaldız",
            gecenSure: "1 sene önce",
            aciklama: "Geçen yaz çekildim",
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2015/03/03/20/42/man-657869_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2019/08/07/14/11/dog-4390885_960_720.jpg",
          ),
          GonderiKarti(
            isimSoyad: "Selda Mert",
            gecenSure: "2 ay önce",
            aciklama: "Manzaraya hayran kaldım",
            profilResimLinki:
                "https://cdn.pixabay.com/photo/2019/11/03/05/36/portrait-4597853_960_720.jpg",
            gonderiResimLinki:
                "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add_a_photo,color: Colors.white,),
        )
    );
  }

  Padding duyuru(String mesaj, String gecenSure) {
    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(mesaj,style: TextStyle(fontSize: 15.0),),
                          Text(gecenSure)
                        ],
                      ),
                    );
  }

  Widget profilKartiOlustur(String kullaniciAdi, String resimLinki,
      String isimSoyad, String kapakResimLinki) {
    return Material(
      child: InkWell(
        onTap: () async {
         bool donenVeri= await Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ProfilSayfasi(
                    profilResimlinki: resimLinki,
                    kullaniciAdi: kullaniciAdi,
                    isimSoyad: isimSoyad,
                    kapakResimlinki: kapakResimLinki,
                  )));

          if(donenVeri){
            print("Kullanıcı profil sayfasından döndü.");
          }         
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Hero(
                    tag: kullaniciAdi,
                                      child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 2.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(35.0),
                          image: DecorationImage(
                              image: NetworkImage(resimLinki),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                kullaniciAdi,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
