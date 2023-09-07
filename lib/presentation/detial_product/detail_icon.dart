import 'package:flutter/material.dart';

class DetailIcon extends StatelessWidget {
  final int length;
  final String title;

  const DetailIcon({
    Key? key,
    required this.length,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gunakan nilai 'length' sesuai kebutuhan Anda dalam pembuatan halaman DetailIcon.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Icon Page'),
      ),
      body: Center(
        child: Text('Length: $title '), // Contoh penggunaan nilai 'length'.
      ),
    );
  }
}
