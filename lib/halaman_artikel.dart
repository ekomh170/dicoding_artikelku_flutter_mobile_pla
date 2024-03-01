import 'package:flutter/material.dart';

class HalamanArtikel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Artikel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daftar Artikel'),
            ElevatedButton(
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
}
