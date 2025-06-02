import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick an Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.front,
    );
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Akses Kamera'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: getImage,
              child: const Text('Ambil Gambar'),
            ),
            const SizedBox(height: 20),
            _image == null
                ? const Text('Tidak ada gambar yang dipilih.')
                : Image.file(_image!),
          ],
        ),
      ),
    );
  }
}