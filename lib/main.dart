import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:whitematrix/authentication.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAxgRGx6pZ4RtO6SS9xEsTdmpKp4MSoxIU",
      appId: "1:892574083279:android:6443acb7fc00b454cd2fba",
      messagingSenderId: "",
      projectId: "whitematrixtest-339be",
      storageBucket: "whitematrixtest-339be.appspot.com"
       )
  );
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
     
      home: AuthScreen(),
    );
  }
}
