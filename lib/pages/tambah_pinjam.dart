import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../data/models/database.dart';
import '../theme/theme.dart';

class TambahPinjam extends StatefulWidget {
  const TambahPinjam({super.key});

  @override
  State<TambahPinjam> createState() => _TambahPinjamState();
}

class _TambahPinjamState extends State<TambahPinjam> {
  final _formKey = GlobalKey<FormState>();
  // list dropdown barang
  List<String> list = ['barang1', 'barang2', 'barang3'];
  late String dropDownValue = list.first;

  // membuat text editing controller untuk nilai-nilai
  TextEditingController peminjamController = TextEditingController();
  TextEditingController spesifikasiController = TextEditingController();
  TextEditingController kondisiController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController tglPinjamController = TextEditingController();
  TextEditingController tglKembaliController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController stuff_idController = TextEditingController(text: '2');

  // memanggil database
  final AppDb database = AppDb();

  // query insert
  Future insert(
      String peminjam,
      String spesifikasi,
      String kondisi,
      int jumlah,
      String jenis,
      DateTime tglPinjam,
      DateTime tglKembali,
      String keterangan,
      int stuff_id) async {
    final createdAt = DateTime.now();
    final updatedAt = DateTime.now();

    final row = await database
        .into(database.loans)
        .insertReturning(LoansCompanion.insert(
          peminjam: peminjam,
          spesifikasi: spesifikasi,
          kondisi: kondisi,
          jumlah: jumlah,
          jenis: jenis,
          tglPinjam: tglPinjam,
          tglKembali: tglKembali,
          keterangan: keterangan,
          stuff_id: stuff_id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        ));

    print(row);
  }

  Future<List<Stuff>> getAllStuff() async {
    return await database.getAllStuffRepo();
  }

  String _peminjam = '';
  String _spesifikasi = '';
  String _kondisi = '';
  String _jumlah = '';
  String _jenis = '';
  String _tglPinjam = '';
  String _tglKembali = '';
  String _keterangan = '';

  // fungsi menampilkan tanggal
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050))
        .then((value) {
      if (value != null) {
        tglPinjamController.text = value.toString();
        tglKembaliController.text = value.toString();
      }
    });
  }

  // Fungsi untuk
  // fungsi untuk merapihkan tulisan format tanggal hari,tanggal hari,bulan dan tahun
  String _formatDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      final formattedDate =
          DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);
      return formattedDate;
    }
    return ' ';
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget heading() {
      return AppBar(
        backgroundColor: const Color.fromRGBO(79, 112, 156, 1),
        title: const Text(
          "Barang Dipinjam",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tekstur/buried.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    Widget menuItem() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        // padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: bgcolor2,
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropDownValue,
              isExpanded: true,
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black, // Ubah warna teks sesuai kebutuhan
                      fontSize: 16, // Ubah ukuran teks sesuai kebutuhan
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    dropDownValue = value;
                  });
                }
              },
              style: TextStyle(
                color: Colors.black, // Ubah warna teks sesuai kebutuhan
                fontSize: 16, // Ubah ukuran teks sesuai kebutuhan
              ),
              dropdownColor: bgcolor2, // Ubah warna dropdown sesuai kebutuhan
              icon: Icon(
                Icons.arrow_drop_down, // Ubah ikon dropdown sesuai kebutuhan
                color:
                    Colors.black, // Ubah warna ikon dropdown sesuai kebutuhan
              ),
            ),
          ),
        ),
      );
    }

    Widget peminjam() {
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
          controller: peminjamController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Peminjam',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Peminjam';
            }
            return null;
          },
          onSaved: (value) {
            _spesifikasi = value!;
          },
        ),
      );
    }

    Widget spesifikasi() {
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
          controller: spesifikasiController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Spesifikasi',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Spesifikasi';
            }
            return null;
          },
          onSaved: (value) {
            _spesifikasi = value!;
          },
        ),
      );
    }

    Widget kondisi() {
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

    Widget jumlah() {
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

    Widget jenis() {
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

    Widget tglPinjam() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 9),
        padding: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: tglPinjamController,
                readOnly: true,
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  hintText: 'Tanggal Lahir',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _showDatePicker,
              icon: const Icon(Icons.date_range),
            )
          ],
        ),
      );
    }

    Widget tglKembali() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 9),
        padding: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: tglKembaliController,
                readOnly: true,
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  hintText: 'Tanggal Lahir',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _showDatePicker,
              icon: const Icon(Icons.date_range),
            )
          ],
        ),
      );
    }

    Widget keterangan() {
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
          controller: keteranganController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Keterangan',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Ketarangan';
            }
            return null;
          },
          onSaved: (value) {
            _keterangan = value!;
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
                  peminjamController.text,
                  spesifikasiController.text,
                  kondisiController.text,
                  int.parse(jumlahController.value.text),
                  jenisController.text,
                  tglPinjamController.text as DateTime,
                  tglKembaliController.text as DateTime,
                  keteranganController.text,
                  int.parse(stuff_idController.text));
              // insert(
              // namaBarangController.text,
              // kondisiController.text,
              // sumberDanaController.text,
              // int.parse(hargaController.value.text),
              // jenisController.text,
              // int.parse(jumlahController.value.text),
              // );
              // Lakukan validasi login dengan mengirimkan data username dan password ke backend atau melakukan pengecekan secara lokal.
              Navigator.pushNamed(context, '/home-page');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Tambah Peminjaman'),
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

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(245, 239, 231, 1),
        appBar: heading(),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tekstur/fabric-of-squares.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 44),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      peminjam(),
                      menuItem(),
                      spesifikasi(),
                      kondisi(),
                      jumlah(),
                      jenis(),
                      tglPinjam(),
                      tglKembali(),
                      keterangan(),
                      button()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
