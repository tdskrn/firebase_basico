import 'package:fluter_basico/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _refCol =
      firestore.collection("teste3");
  _refCol.doc().set({"name": "Vinicius"});

  runApp(MaterialApp(home: Home()));
}
