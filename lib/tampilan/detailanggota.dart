import 'package:flutter/material.dart';

class DetailAnggota extends StatelessWidget {
  final Map<String, String> data;
  final Color primaryGreen = const Color(0xFF1B5E20);

  // Konstruktor untuk menerima data dari halaman struktur
  const DetailAnggota({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Anggota", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            // Foto Profil dengan Animasi Hero
            Hero(
              tag: data['nama']!,
              child: CircleAvatar(
                radius: 75,
                backgroundColor: primaryGreen.withOpacity(0.1),
                backgroundImage: (data['foto'] != null && data['foto'] != "") 
                    ? AssetImage(data['foto']!) 
                    : null,
                child: (data['foto'] == "" || data['foto'] == null) 
                    ? Icon(Icons.person, size: 70, color: primaryGreen) 
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            // Nama Lengkap
            Text(
              data['nama']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Jabatan
            Text(
              data['jabatan']!,
              style: TextStyle(fontSize: 18, color: primaryGreen, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            const Divider(indent: 40, endIndent: 40),
            // Bagian Info Tambahan (Placeholder)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildInfoRow(
                    Icons.email, 
                    "Email", 
                    "${data['nama']?.toLowerCase().replaceAll(' ', '.')}@itc.com"
                  ),
                  // UBAH BAGIAN INI: Ambil data['divisi'] dari Map
                  _buildInfoRow(
                    Icons.account_tree, 
                    "Divisi", 
                    data['divisi'] ?? "ITC Member" // Menggunakan data dinamis
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}