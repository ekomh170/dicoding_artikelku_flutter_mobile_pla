// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HalamanBiodataPembuatAplikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Apps Artikelku', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 4,
              margin: EdgeInsets.all(16.0),
              color: Colors.grey[900],
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage('../assets/profile/profile_pembuat.png'), // Ganti dengan URL gambar profil yang sesuai
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Text(
                          'Eko Muchamad Haryono',
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Dev Mobile & Freelancer',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSectionHeader(context, 'Biodata Pembuat Artikelku :'),
                    SizedBox(height: 16.0),
                    _buildInfoRow('Nama Depan:', 'Eko Muchamad'),
                    _buildInfoRow('Nama Terakhir:', 'Haryono'),
                    _buildInfoRow('Email:', 'ekomh13@gmail.com'),
                    _buildInfoRow('Status:', 'Mahasiswa'),
                    _buildInfoRow('Prodi:', 'Teknik Informatika'),
                    _buildInfoRow('Pengalaman:', 'RS Juliana'),
                    _buildInfoRow('Status Kerja:', 'Freelancer'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            title,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: Icon(Icons.home, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 120.0,
            child: Text(
              label,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HalamanBiodataPembuatAplikasi(),
  ));
}
