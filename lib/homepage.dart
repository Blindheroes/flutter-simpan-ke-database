import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simpan_ke_database/tambahdata.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _listData = [];
  bool _isLoading = true;

  Future getData() async {
    try {
      // harus pakai = flutter run -d chrome --web-browser-flag "--disable-web-security" :(
      final respon = await http
          .get(Uri.parse('http://192.168.1.10/flutterApi/CRUD/read.php'));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listData = data;
        });
      } else {
        print('status ${respon.statusCode}');
      }

      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("stasus code ${e}");
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: _listData.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.black87,
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: ListTile(
                    title: Text(
                      "NRP: ${_listData[index]['NRP']} ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    subtitle: Text(
                      "Nama Mahasiswa: ${_listData[index]['Nama Mahasiswa']} \nAngkatan: ${_listData[index]['Angkatan']}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        mini: false,
        hoverColor: Colors.lime[700],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TambahData(),
              ));
        },
        child: const FaIcon(FontAwesomeIcons.circlePlus),
      ),
    );
  }
}
