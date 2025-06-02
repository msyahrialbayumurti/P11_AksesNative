// lib/pages/detail_page.dart

import 'package:flutter/material.dart';
import '../models/kabupaten.dart';
import '../utils/launcher.dart';

class DetailPage extends StatelessWidget {
  final Kabupaten kabupaten;

  const DetailPage({super.key, required this.kabupaten});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF28E622),
          title: Text(kabupaten.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.network(
              kabupaten.logoUrl,
              height: 100,
              errorBuilder: (_, __, ___) => const Icon(Icons.image),
            ),
            const SizedBox(height: 16),
            Text("Pusat Pemerintahan: ${kabupaten.pusatPemerintahan}"),
            Text("Bupati/Walikota: ${kabupaten.bupati}"),
            Text("Luas Wilayah: ${kabupaten.luas} km²"),
            Text("Jumlah Penduduk: ${kabupaten.penduduk}"),
            Text("Jumlah Kecamatan: ${kabupaten.kecamatan}"),
            Text("Jumlah Kelurahan: ${kabupaten.kelurahan}"),
            Text("Jumlah Desa: ${kabupaten.desa}"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => launchWebsite(kabupaten.website),
              child: const Text('Kunjungi Website Resmi'),
            )
          ],
        ),
      ),
    );
  }
}
