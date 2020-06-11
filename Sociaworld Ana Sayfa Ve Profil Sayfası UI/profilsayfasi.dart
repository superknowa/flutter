import 'package:flutter/material.dart';
import 'package:sociaworld/gonderikarti.dart';

class ProfilSayfasi extends StatelessWidget {

  final String isimSoyad;
  final String kullaniciAdi;
  final String kapakResimLinki;
  final String profilResimLinki;

  const ProfilSayfasi({Key key, this.isimSoyad, this.kullaniciAdi, this.kapakResimLinki, this.profilResimLinki}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
                //color: Colors.yellow,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: NetworkImage(kapakResimLinki),
                    fit: BoxFit.cover
                  )
                )
              ),
              Positioned(
                left: 20.0,
                bottom: 0.0,
                child: Hero(
                  tag: kullaniciAdi,
                                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      image: NetworkImage(profilResimLinki),
                      fit: BoxFit.cover
                    ),
                      border: Border.all(width: 2.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      isimSoyad,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      kullaniciAdi,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 130.0,
                right: 15.0,
                child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.grey[200],
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_circle,
                          size: 18.0,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          "Takip Et",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )),
              ),
              IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){
                Navigator.pop(context,true);
              }),
            ],
          ),
          SizedBox(height: 20.0,),
          Container(
            height: 75.0,
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                sayac("Takipçi","20K"),
                sayac("Takip","500"),
                sayac("Paylaşım","75"),
                
              ],
            ),
            ),

            GonderiKarti(
            profilResimLinki: "https://cdn.pixabay.com/photo/2019/11/03/05/36/portrait-4597853_960_720.jpg",
            gonderiResimLinki: "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
            isimSoyad: "Selda Mert",
            aciklama: "Manzaraya hayran kaldım",
            gecenSure: "2 ay önce",
            )
            
        ],
      ),
    );
  }

  Column sayac(String baslik,String sayi) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(sayi, style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.black,),),
                  SizedBox(height: 4.0,),
                  Text(baslik, style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold, color: Colors.grey[600],),),
                ],
              );
  }
}
