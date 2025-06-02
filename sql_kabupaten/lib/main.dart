import 'package:flutter/material.dart';
import 'pages/home_page.dart'; // pastikan path ini sesuai struktur foldermu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kabupaten/Kota Riau',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // opsional biar keren
      ),
      home: const HomePage(), // pake halaman HomePage yang sudah kamu buat
    );
  }
}
