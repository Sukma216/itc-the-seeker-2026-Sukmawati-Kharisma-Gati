import 'package:flutter/material.dart';
import 'detailanggota.dart'; 

class StructureScreen extends StatelessWidget {
  final Color primaryGreen = const Color(0xFF1B5E20);

  
  final List<Map<String, String>> itcleader = [
    {"nama": "Grace Rianty Butar Butar", "jabatan": "Chairman", "foto": "assets/images/PH/c.jpeg"},
    {"nama": "Dzaki Ghatfaan Abhipraya", "jabatan": "Vice Chairman", "foto": "assets/images/PH/vc.jpeg"},
    {"nama": "Nayla Saskia Zallianti", "jabatan": "Secretary", "foto": "assets/images/PH/secre.jpeg"},
    {"nama": "Dewi Rahmawati", "jabatan": "Treasury", "foto": "assets/images/PH/treasure.jpeg"},
  ];

  // Data per Divisi
  final List<Map<String, dynamic>> divisiData = [
    {
      "nama_divisi": "Medinfo",
      "anggota": [
        {"nama": "M. Rafli Wibowo", "jabatan": "Head of Division", "foto": "assets/images/PDD/kadiv.jpeg"},
        {"nama": "Satya Dio Putranto", "jabatan": "Deputy Head of Division", "foto": "assets/images/PDD/wakadiv.jpeg"},
        {"nama": "Wilda Nafi'an", "jabatan": "Deputy Head of Division", "foto": "assets/images/PDD/wakadiv1.jpeg"},
      ]
    },
    {
      "nama_divisi": "Machine Learning",
      "anggota": [
        {"nama": "Bintang Ramadhan", "jabatan": "Head of Division", "foto": "assets/images/MACHINE/kadiv.jpeg"},
        {"nama": "M Dimas Setiaji", "jabatan": "Deputy Head of Division", "foto": "assets/images/MACHINE/wakadiv.jpeg"},
      ]
    },
    {
      "nama_divisi": "Web Development",
      "anggota": [
        {"nama": "Gradiva Arya Wicaksana", "jabatan": "Head of Division", "foto": "assets/images/WEB/kadiv.jpeg"},
        {"nama": "Farhannivta Ramadhana", "jabatan": "Deputy Head of Division", "foto": "assets/images/WEB/wakadiv1.jpeg"},
        {"nama": "Marvel Valensiano", "jabatan": "Deputy Head of Division", "foto": "assets/images/WEB/wakadiv.jpeg"},
      ]
    },
    {
      "nama_divisi": "UI/UX",
      "anggota": [
        {"nama": "M. Ruhul Jadid", "jabatan": "Head of Division", "foto": "assets/images/UI/kadiv.jpeg"},
        {"nama": "Gita Ristya", "jabatan": "Deputy Head of Division", "foto": "assets/images/UI/wakadiv.jpeg"},
      ]
    },
    {
      "nama_divisi": "Project Manager",
      "anggota": [
        {"nama": "Kurnia Salasa", "jabatan": "Head of Division", "foto": "assets/images/PM/kadiv.jpeg"},
        {"nama": "Fahri Hidayatullah", "jabatan": "Deputy Head of Division", "foto": "assets/images/PM/wakadiv.jpeg"},
      ]
    },
    {
      "nama_divisi": "Competitive Programming",
      "anggota": [
        {"nama": "M. Rizal A. Sucipno", "jabatan": "Head of Division", "foto": "assets/images/CP/kadiv.jpeg"},
        {"nama": "F. S. Dewaki Tyasing Suryo", "jabatan": "Deputy Head of Division", "foto": "assets/images/CP/wakadiv.jpeg"},
      ]
    },
    {
      "nama_divisi": "Mobile Development",
      "anggota": [
        {"nama": "Bintoro", "jabatan": "Head of Division", "foto": "assets/images/MOBILE/kadiv.jpeg"},
        {"nama": "Ikhsan Fillah Hidayat", "jabatan": "Deputy Head of Division", "foto": "assets/images/MOBILE/wakadiv.jpeg"},
      ]
    },
  ];

  // navigasi ke halaman detail
  void _pindahKeDetail(BuildContext context, Map<String, String> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailAnggota(data: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Organization Structure", style: TextStyle(color: Colors.white)),
        backgroundColor: primaryGreen,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          // --- SECTION ITC LEADER ---
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "ITC Core Team",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildWideCard(context, itcleader[index]), // Tambah context
              childCount: itcleader.length,
            ),
          ),

          // --- SECTION PER DIVISI ---
          for (var divisi in divisiData) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 15),
                child: Column(
                  children: [
                    Text(
                      divisi['nama_divisi'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: primaryGreen,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 40,
                      height: 3,
                      color: primaryGreen.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildGridCard(context, divisi['anggota'][index]), // Tambah context
                  childCount: divisi['anggota'].length,
                ),
              ),
            ),
          ],
          
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }

  // Card Lebar (Ketua/Wakil)
  Widget _buildWideCard(BuildContext context, Map<String, String> data) {
    return GestureDetector(
      onTap: () => _pindahKeDetail(context, data),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: Hero(
            tag: data['nama']!, 
            child: CircleAvatar(
              radius: 30,
              backgroundColor: primaryGreen.withOpacity(0.1),
              backgroundImage: data['foto'] != "" ? AssetImage(data['foto']!) : null,
              child: data['foto'] == "" ? Icon(Icons.person, color: primaryGreen, size: 30) : null,
            ),
          ),
          title: Text(data['nama']!, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(data['jabatan']!, style: TextStyle(color: primaryGreen, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  // Card Grid (Kadiv/Wakadiv)
  Widget _buildGridCard(BuildContext context, Map<String, String> data) {
    return GestureDetector(
      onTap: () => _pindahKeDetail(context, data),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: data['nama']!, 
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[100],
                backgroundImage: (data['foto'] != null && data['foto'] != "") ? AssetImage(data['foto']!) : null,
                child: (data['foto'] == null || data['foto'] == "") ? Icon(Icons.person, color: primaryGreen, size: 35) : null,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                data['nama']!, 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(data['jabatan']!, style: TextStyle(color: primaryGreen, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}