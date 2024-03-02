import 'package:flutter/material.dart';

void main() {
  runApp(HalamanDetailArtikel());
}

class Artikel {
  final String judul;
  final String sinopsis;
  final String deskripsi;
  final String penulis;
  final DateTime tanggalTerbit;
  final List<String> ulasan;

  Artikel(this.judul, this.sinopsis, this.deskripsi, this.penulis, this.tanggalTerbit, this.ulasan);
}

class HalamanDetailArtikel extends StatefulWidget {
  @override
  _HalamanDetailArtikelState createState() => _HalamanDetailArtikelState();
}

class _HalamanDetailArtikelState extends State<HalamanDetailArtikel> {
  String searchText = '';

  List<Artikel> daftarArtikel = [
    Artikel(
        'Rahasia Geez',
        'Geez harus menemukan rahasia yang mengubah hidupnya secara drastis.',
        'Cerita ini mengikuti perjalanan Geez dalam pencarian rahasia yang akhirnya mengubah hidupnya.',
        'John Doe',
        DateTime(2023, 10, 15),
        ['Artikel ini sangat menginspirasi!', 'Sangat bermanfaat untuk membuka pikiran.']),
    Artikel(
        'Boboiboy',
        'Boboiboy adalah pahlawan yang melindungi dunia dari ancaman alien jahat.',
        'Ketika alien jahat mengancam bumi, Boboiboy dan teman-temannya beraksi untuk melindungi planet mereka.',
        'Jane Smith',
        DateTime(2023, 11, 20),
        ['Saya suka cara cerita ini dibangun!', 'Sangat cocok untuk anak-anak.']),
    Artikel(
        'Kata',
        'Kata-kata sederhana yang memiliki makna mendalam bagi kehidupan kita.',
        'Artikel ini menjelaskan tentang kekuatan kata-kata dalam membentuk pemikiran dan tindakan kita sehari-hari.',
        'Michael Johnson',
        DateTime(2023, 12, 5),
        ['Setiap kata memiliki dampaknya sendiri.', 'Sangat menginspirasi untuk mengeksplorasi kekuatan bahasa.']),
    Artikel(
        'Logika Pemrograman Python',
        'Pengantar dasar tentang logika pemrograman dengan menggunakan bahasa pemrograman Python.',
        'Cerita ini membahas konsep dasar logika pemrograman dan memberikan contoh penggunaan dalam bahasa pemrograman Python.',
        'Emily Brown',
        DateTime(2024, 1, 10),
        ['Sangat membantu untuk memahami dasar-dasar pemrograman.', 'Bahasa yang digunakan sangat mudah dimengerti.']),
    Artikel(
        'PHP Dasar & Laravel 7',
        'Panduan lengkap untuk memulai pengembangan web dengan PHP dan Laravel 7.',
        'Artikel ini membantu pembaca memahami dasar-dasar pengembangan web dengan menggunakan PHP dan framework Laravel 7.',
        'Daniel Wilson',
        DateTime(2024, 2, 15),
        ['Sangat berguna untuk pemula.', 'Tersedia banyak contoh yang membantu pemahaman.']),
    Artikel(
        'React JS Belajar',
        'Pengantar singkat tentang pengembangan web dengan React JS.',
        'Cerita ini memberikan panduan awal bagi pembaca yang ingin mempelajari pengembangan web menggunakan React JS.',
        'Sophia Martinez',
        DateTime(2024, 3, 20),
        ['Sangat bagus untuk pemula.', 'Tutorial yang mudah diikuti.']),
  ];

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).scaffoldBackgroundColor == Colors.black
        ? Colors.white
        : Colors.black;

    // Membuat daftar artikel yang akan ditampilkan berdasarkan hasil pencarian
    List<Artikel> filteredArtikel = _getFilteredArtikel(searchText);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Apps Artikelku',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            // Tombol kembali pada AppBar
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(height: 8.0),
            Text(
              'Selamat Datang di Artikelku!!',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24.0, // Menyesuaikan ukuran teks
              ),
            ),
            SizedBox(height: 8.0),
            SizedBox(height: 8.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: '🔍 Cari artikel disini',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: textColor),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kumpulan Artikel :',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              children: filteredArtikel
                  .map((artikel) => ArtikelCard(artikel, textColor))
                  .toList(),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  // Logika untuk memfilter daftar artikel berdasarkan kata kunci pencarian
  List<Artikel> _getFilteredArtikel(String searchText) {
    if (searchText.isEmpty) {
      return daftarArtikel;
    } else {
      return daftarArtikel
          .where((artikel) =>
              artikel.judul.toLowerCase().contains(searchText.toLowerCase()) ||
              artikel.sinopsis
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) ||
              artikel.deskripsi
                  .toLowerCase()
                  .contains(searchText.toLowerCase()))
          .toList();
    }
  }
}

class ArtikelCard extends StatelessWidget {
  final Artikel artikel;
  final Color textColor;

  ArtikelCard(this.artikel, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        title: Text(
          artikel.judul,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          artikel.sinopsis,
          style: TextStyle(color: textColor),
        ),
        onTap: () {
          // Navigasi ke halaman detail artikel ketika card ditekan
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailArtikelPage(artikel: artikel),
            ),
          );
        },
      ),
    );
  }
}

class DetailArtikelPage extends StatelessWidget {
  final Artikel artikel;

  DetailArtikelPage({required this.artikel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artikel.judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              artikel.sinopsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              artikel.deskripsi,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Penulis: ${artikel.penulis}',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 8),
            // Tidak ada pemformatan tanggal di sini
            SizedBox(height: 16),
            Text(
              'Ulasan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: artikel.ulasan.map((ulasan) => Text(ulasan)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
