import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireworks/models/kullanici.dart';

class BenimAuthServisim {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Kullanici _kullaniciOlustur(FirebaseUser firebaseKullanici){
    return firebaseKullanici == null ? null : Kullanici.firebasedenUret(firebaseKullanici);
  }

  Stream<Kullanici> get durumTakipcisi {
    return _firebaseAuth.onAuthStateChanged.map(_kullaniciOlustur);
  }

  Future<Kullanici> anonimGiris() async {
    var authResult = await _firebaseAuth.signInAnonymously();
    return _kullaniciOlustur(authResult.user);
  }

  Future<void> cikisYap(){
    return _firebaseAuth.signOut();
  }


}
