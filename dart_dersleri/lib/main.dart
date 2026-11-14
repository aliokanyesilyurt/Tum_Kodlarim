import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Giris Ekranı', home: Iskele());
  }
}

class Iskele extends StatefulWidget {
  const Iskele({super.key});

  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();

  void girisYap() {
    String kullaniciAdi = t1.text;
    String sifre = t2.text;

    FirebaseFirestore.instance.collection("kullanicilar").add({
      "kullaniciAdi": kullaniciAdi,
      "sifre": sifre,
    });

    t1.clear();
    t2.clear();
  }

  @override
  void dispose() {
    t1.dispose();
    t2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Giriş Sayfası"),
            TextFormField(
              controller: t1,
              decoration: InputDecoration(hintText: "Kullanıcı Adı"),
            ),
            TextFormField(
              controller: t2,
              decoration: InputDecoration(hintText: "Şifre"),
            ),
            ElevatedButton(onPressed: girisYap, child: Text("Giriş Yap")),
          ],
        ),
      ),
    );
  }
}
