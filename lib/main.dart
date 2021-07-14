import 'package:fluter_basico/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /*CollectionReference<Map<String, dynamic>> _refCol =
      firestore.collection("teste");

  _refCol.doc('001').set({"name": "Vinicius"});
*/
  /*firestore
      .collection('noticias')
      .add({"noticia": "Primeira Noticia", "cidade": "Ipanema"});

  firestore
      .collection('noticias')
      .doc("yafTDXwbx40tzNkpdnQw")
      .set({"cidade": "Taparuba"});*/
  /*DocumentReference ref =
      await firestore.collection('noticias').add({"campo1": 2, "campo2": 3});

  print("Referencia de id:" + ref.id);*/

  /*DocumentSnapshot snapshot =
      await firestore.collection("usuarios").doc("001").get();
  print((snapshot.data() as dynamic)["nome"]);
  print((snapshot.data() as dynamic)["idade"]);*/

  //QuerySnapshot querySnapshot = await firestore.collection('usuarios').get();
  /*DocumentSnapshot snapshot =
      await firestore.collection("usuarios").doc("001").get();
  dynamic dados = snapshot.data();
  print(dados['nome']);*/

  /*QuerySnapshot querySnapshot = await firestore.collection("usuarios").get();
  print("dados" + querySnapshot.docs.toString());

  for (DocumentSnapshot item in querySnapshot.docs) {
    dynamic dados = item.data();
    print(dados["nome"] + ' ' + dados['idade'].toString());
  }*/

  QuerySnapshot querySnapshot = await firestore
      .collection("usuarios")
      .where("idade", isLessThan: 26)
      .get();
  print("dados" + querySnapshot.docs.toString());

  for (DocumentSnapshot item in querySnapshot.docs) {
    dynamic dados = item.data();
    print(dados["nome"] + ' ' + dados['idade'].toString());
  }

  runApp(MaterialApp(home: Home()));
}
