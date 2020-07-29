import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/services/benimAuthServisim.dart';
import 'package:fireworks/yonlendirmeSayfasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Provider<BenimAuthServisim>(
      create: (_) => BenimAuthServisim(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: YonlendirmeSayfasi(),
      ),
    );
  }
}




