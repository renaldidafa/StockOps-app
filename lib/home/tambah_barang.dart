import 'dart:math';
import 'dart:io'; 

import 'package:flutter/material.dart';
import 'package:stock_ops/data/models/database.dart';
import 'package:stock_ops/theme/theme.dart';

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final _formKey = GlobalKey<FormState>();

  // connecting database
  final AppDb database = AppDb();

  // insert data
  // membuat text editing controller untuk mengambil inputan dari user
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController spesifikasiController = TextEditingController();
  TextEditingController kondisiController = TextEditingController();
  TextEditingController sumberDanaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  // Akhir dari controller

  Future insert(String nama_barang, String kondisi, String sumber_dana,
      int harga, String jenis, int jumlah) async {
    final createdAt = DateTime.now();
    final updatedAt = DateTime.now();

    final row = await database.into(database.goods).insertReturning(
          GoodsCompanion.insert(
              nama_barang: nama_barang,
              kondisi: kondisi,
              sumber_dana: sumber_dana,
              harga: harga,
              jenis: jenis,
              jumlah: jumlah,
              createdAt: createdAt,
              updatedAt: updatedAt),
        );
    // print(row);

    // print(row.id);
    // log(row) => print(row.id);
    // print("anak babi");
  }
  // end insert data

  String _namaBarang = '';
  String _spesifikasi = '';
  String _kondisi = '';
  String _sumberDana = '';
  String _harga = '';
  String _jenis = '';
  String _jumlah = '';
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Tambah Barang',
          style: primaryTextStyleButton.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home-page');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextButton,
          ),
        ),
      );
    }

    Widget inputNama() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user nama barang
          controller: namaBarangController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Nama Barang',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Nama Barang';
            }
            return null;
          },
          onSaved: (value) {
            _namaBarang = value!;
          },
        ),
      );
    }

    Widget inputKondisi() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user kondisi
          controller: kondisiController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Kondisi',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Kondisi';
            }
            return null;
          },
          onSaved: (value) {
            _kondisi = value!;
          },
        ),
      );
    }

    Widget inputSumberDana() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user sumber dana
          controller: sumberDanaController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Sumber Dana',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Sumber dana';
            }
            return null;
          },
          onSaved: (value) {
            _sumberDana = value!;
          },
        ),
      );
    }

    Widget inputHarga() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user harga
          controller: hargaController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Harga',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Harga';
            }
            return null;
          },
          onSaved: (value) {
            _harga = value!;
          },
        ),
      );
    }

    Widget inputJenis() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user jenis
          controller: jenisController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Jenis',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Jenis';
            }
            return null;
          },
          onSaved: (value) {
            _jenis = value!;
          },
        ),
      );
    }

    Widget inputJumlah() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          // controller untuk mengambil inputan dari user jumlah
          controller: jumlahController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Jumlah',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Jumlah';
            }
            return null;
          },
          onSaved: (value) {
            _jumlah = value!;
          },
        ),
      );
    }

    Widget button() {
      return Container(
        key: UniqueKey(),
        width: double.infinity,
        margin: const EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            // insert(nama_barang, kondisi, sumber_dana, harga, jenis, jumlah)
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Panggil fungsi insert yang sudah didefinisikan sebelumnya, ini untuk memasukan nilai ke database, jika berhasil maka akan menampilkan pesan berhasil
              insert(
                namaBarangController.text,
                kondisiController.text,
                sumberDanaController.text,
                int.parse(hargaController.value.text),
                jenisController.text,
                int.parse(jumlahController.value.text),
              );
              // Lakukan validasi login dengan mengirimkan data username dan password ke backend atau melakukan pengecekan secara lokal.
              Navigator.pushNamed(context, '/home-page');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Tambah Barang'),
                    content: const Text('Mantap'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Tutup'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text(
            'Tambah Barang',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor1,
        appBar: header(),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 44),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    inputNama(),
                    inputKondisi(),
                    inputSumberDana(),
                    inputHarga(),
                    inputJenis(),
                    inputJumlah(),
                    button(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
