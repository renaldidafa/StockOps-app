import 'package:flutter/material.dart';
import 'package:stock_ops/data/models/database.dart';
import 'package:stock_ops/theme/theme.dart';

class EditBarangPage extends StatefulWidget {
  final int? id_barang;
  const EditBarangPage({super.key, required this.id_barang});

  @override
  State<EditBarangPage> createState() => _EditBarangPageState();
}

class _EditBarangPageState extends State<EditBarangPage> {
  // conecting database
  final AppDb database = AppDb();
  // // membuat text editing controller untuk mengambil inputan dari user
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kondisiController = TextEditingController();
  TextEditingController sumberDanaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _namaBarang = '';
  String _spesifikasi = '';
  String _kondisi = '';
  String _sumberDana = '';
  String _harga = '';
  String _jenis = '';
  String _jumlah = '';

  // untuk mengambil data dari database berdasarkan id_barang
  // Future<Stuff?> getStuffById(int id) async {
  //   return await database.getStuffByIdRepo(id);
  // }

  // Memanggil dulu tabel berdasarkan id_barang yang akan diedit
  Future<Stuff?> getStuffById(int? id) async {
    if (id != null) {
      return await database.getStuffByIdRepo(id);
    } else {
      return null;
    }
  }

  Future update(
    int stuff_id,
    String nama_barang_baru,
    String kondisi_baru,
    String sumber_dana_baru,
    int harga_baru,
    String jenis_baru,
    int jumlah_baru,
  ) async {
    return await database.updateStuffRepo(stuff_id, nama_barang_baru,
        kondisi_baru, sumber_dana_baru, harga_baru, jenis_baru, jumlah_baru);
  }

  // untuk mengambil data dari database berdasarkan id_barang

  // mengisi nilai dengan nilai yang sudah ada

  @override
  void initState() {
    super.initState();
    namaBarangController =
        TextEditingController(); // Inisialisasi controller di initState()
    getStuffById(widget.id_barang).then((value) {
      namaBarangController.text = value!.nama_barang;
      kondisiController.text = value.kondisi;
      sumberDanaController.text = value.sumber_dana;
      hargaController.text = value.harga.toString();
      jenisController.text = value.jenis;
      jumlahController.text = value.jumlah.toString();
    }); // Panggil getStuffById di initState
  }

  @override
  Widget build(BuildContext context) {
    // print('ID Barang : ${widget.id_barang}');

    // print('Nama Barang Awal : ${namaBarangController.text}');

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit Barang',
          style: primaryTextStyleButton.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 24),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Lakukan validasi login dengan mengirimkan data username dan password ke backend atau melakukan pengecekan secara lokal.
              update(
                  widget.id_barang!,
                  namaBarangController.text,
                  kondisiController.text,
                  sumberDanaController.text,
                  int.parse(hargaController.value.text),
                  jenisController.text,
                  int.parse(jumlahController.value.text));
              Navigator.pushNamed(context, '/home-page');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Edit Barang'),
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
            'Simpan',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: button(),
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
