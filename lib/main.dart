import 'package:flutter/material.dart';
import 'halaman_utama_splash.dart';
import 'halaman_artikel.dart';
import 'halaman_detail_artikel.dart';
import 'halaman_biodata_pembuat_aplikasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => HalamanUtamaSplash(),
    '/artikel': (context) => HalamanArtikel(),
    '/detailArtikel': (context) => HalamanDetailArtikel(),
    '/biodataPembuatAplikasi': (context) => HalamanBiodataPembuatAplikasi(),
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