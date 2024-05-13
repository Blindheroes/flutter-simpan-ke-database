import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simpan_ke_database/homepage.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nrpContriller = TextEditingController();
  final TextEditingController _namaContriller = TextEditingController();
  final TextEditingController _angkatanContriller = TextEditingController();

  Future _saveData() async {
    final respon = await http.post(
        Uri.parse('http://192.168.137.99/flutterApi/CRUD/create.php'),
        body: {
          "NRP": _nrpContriller.text,
          "Nama Mahasiswa": _namaContriller.text,
          "Angkatan": _angkatanContriller.text,
        });

    // _nrpContriller.clear();
    // _namaContriller.clear();
    // _angkatanContriller.clear();

    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambahkan Data"),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextFormField(
                    controller: _nrpContriller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "NRP Tidak Boleh Kososng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "NRP ",
                        hintText: "ex: 50242110**",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 10.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: _namaContriller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Nama Tidak Boleh Kososng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Nama Mahasiswa ",
                        hintText: "ex: Muhammad Fathi Farhat",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 10.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: _angkatanContriller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Angkatan Tidak Boleh Kososng";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "Angkatan ",
                        hintText: "ex: 20**",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 10.0, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(10)))),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveData().then((value) {
                          if (value) {
                            const snackBar = SnackBar(
                              content: Text('Data Berhasil Disimpan!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (route) => false);
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Data Gagal Disimpan!'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("simpan"))
              ],
            ),
          )),
    );
  }
}
