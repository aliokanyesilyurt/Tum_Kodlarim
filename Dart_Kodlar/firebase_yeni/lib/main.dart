import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FemTech Firebase Projesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Iskele(),
    );
  }
}

class Iskele extends StatefulWidget {
  const Iskele({super.key});
  @override
  State<Iskele> createState() => _IskeleState();
}

class _IskeleState extends State<Iskele> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  void googleGirisYap() async {
    // 1. Google penceresini açar
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      print("Aga kullanıcı girişi iptal etti, bilet yok.");
      return; 
    }

    // 2. Seçilen hesaptan kimlik bilgilerini alır
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // 3. Firebase için giriş anahtarı oluşturur
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // 4. Firebase'e bu anahtarla giriş yapar
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text("Giriş Seçenekleri", style: TextStyle(fontWeight: FontWeight(300), fontStyle: FontStyle.italic)),
                Row(
                  children: [
                    ElevatedButton.icon(
              onPressed: () => googleGirisYap(),
              icon: const Icon(Icons.g_mobiledata, size: 35),
              label: const Text(
                "Google ile Giriş Yap",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                    ),
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}