// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(HalamanArtikel());
}

class HalamanArtikel extends StatefulWidget {
  @override
  _HalamanArtikelState createState() => _HalamanArtikelState();
}

class _HalamanArtikelState extends State<HalamanArtikel> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).scaffoldBackgroundColor == Colors.black ? Colors.white : Colors.black;

    // Membuat daftar artikel yang akan ditampilkan berdasarkan hasil pencarian
    List<String> filteredArtikel = _getFilteredArtikel(searchText);

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
          leading: IconButton( // Tombol kembali pada AppBar
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
            Text(
              'Mau Baca Artikel? Silahkan Pilih Artikel Kesukaan Anda!!',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
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
              'Genre Artikel :',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                GenreCard('Pendidikan', Icons.book, textColor),
                GenreCard('Novel', Icons.book_online, textColor),
                GenreCard('Makalah', Icons.article, textColor),
                GenreCard('Komik', Icons.auto_stories, textColor),
              ],
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
              children: filteredArtikel.map((artikel) => ArtikelCard(artikel, Icons.book, textColor)).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 0, 0),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/detailArtikel');
              },
              child: Text('Baca Artikel'),
            ),
          ],
        ),
      ),
    );
  }

  // Logika untuk memfilter daftar artikel berdasarkan kata kunci pencarian
  List<String> _getFilteredArtikel(String searchText) {
    if (searchText.isEmpty) {
      return [
        'Rahasia Geez - Nadhifa Allya Tsana',
        'Boboiboy',
        'Kata - Nadhifa Allya Tsana',
        'Logika Pemograman Python',
        'PHP Dasar & Laravel 7',
        'React JS Belajar'
      ];
    } else {
      return [
        'Rahasia Geez - Nadhifa Allya Tsana',
        'Boboiboy',
        'Kata - Nadhifa Allya Tsana',
        'Logika Pemograman Python',
        'PHP Dasar & Laravel 7',
        'React JS Belajar'
      ].where((artikel) => artikel.toLowerCase().contains(searchText.toLowerCase())).toList();
    }
  }
}

class GenreCard extends StatelessWidget {
  final String genre;
  final IconData icon;
  final Color textColor;

  GenreCard(this.genre, this.icon, this.textColor);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: textColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      onPressed: () {},
      icon: Icon(icon),
      label: Text(genre),
    );
  }
}

class ArtikelCard extends StatelessWidget {
  final String artikel;
  final IconData icon;
  final Color textColor;

  ArtikelCard(this.artikel, this.icon, this.textColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          artikel,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
