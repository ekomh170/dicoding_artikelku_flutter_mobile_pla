// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class HalamanUtamaSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama - Splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nama Aplikasi',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/artikel');
              },
              child: Text('Lanjut ke Artikel'),
            ),
          ],
        ),
      ),
    );
  }
}
