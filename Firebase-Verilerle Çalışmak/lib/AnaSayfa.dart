import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnaSayfa extends StatelessWidget {

  cikisYap(BuildContext context){
    var _benimAuthServisim = Provider.of<BenimAuthServisim>(context,listen: false);
    _benimAuthServisim.cikisYap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(onTap: ()=>cikisYap(context), child: Text("Çıkış Yap")),
      ),
    );
  }
}