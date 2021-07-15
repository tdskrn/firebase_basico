import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _picker = ImagePicker();

  Future<File> _recuperarCamera() async {
    PickedFile? imgCamera = await _picker.getImage(source: ImageSource.camera);
    final File file = File(imgCamera!.path);
    return file;
  }

  Future<File> _recuperarGaleria() async {
    PickedFile? imggaleria =
        await _picker.getImage(source: ImageSource.gallery);
    final File file = File(imggaleria!.path);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Básico'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _recuperarCamera();
              },
              child: Text("Camera"),
            ),
            ElevatedButton(
              onPressed: () {
                print(_recuperarGaleria().toString());
              },
              child: Text("Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
