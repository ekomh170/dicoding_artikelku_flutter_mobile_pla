import 'package:flutter/material.dart';

class HalamanUtamaSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Artikelku',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Artikelku',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Roboto', // Contoh: Menggunakan font Roboto
              ),
            ),
            SizedBox(height: 20),
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
              child: Text(
                'Lanjut ke Artikel',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto', // Contoh: Menggunakan font Roboto
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Motto Aplikasi:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Roboto', // Contoh: Menggunakan font Roboto
              ),
            ),
            Text(
              'Membaca Buku Setiap Waktu',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Roboto', // Contoh: Menggunakan font Roboto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
