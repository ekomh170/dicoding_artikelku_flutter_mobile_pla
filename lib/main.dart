import 'package:flutter/material.dart';
import 'halaman_utama_splash.dart';
import 'halaman_artikel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => HalamanUtamaSplash(),
    '/artikel': (context) => HalamanArtikel(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artikelku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}
