// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HalamanDetailArtikel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Detail Artikel'),
      ),
      body: Center(
        child: Text('Ini adalah detail artikel.'),
      ),
    );
  }
}
