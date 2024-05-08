import 'package:flutter/material.dart';
import 'package:simpan_ke_database/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "database mahasiswa",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: HomePage(),
    );
  }
}
