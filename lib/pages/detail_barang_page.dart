import 'package:flutter/material.dart';
import 'package:stock_ops/theme/theme.dart';

import '../data/models/database.dart';

class DetailBarang extends StatefulWidget {
  final int? id_barang;
  const DetailBarang({super.key, required this.id_barang});

  @override
  State<DetailBarang> createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  // conecting database
  final AppDb database = AppDb();
  // // membuat text editing controller untuk mengambil inputan dari user
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController kondisiController = TextEditingController();
  TextEditingController sumberDanaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  // Memanggil dulu tabel berdasarkan id_barang yang akan diedit
  Future<Stuff?> getStuffById(int? id) async {
    if (id != null) {
      return await database.getStuffByIdRepo(id);
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    namaBarangController =
        TextEditingController(); // Inisialisasi controller di initState()

    getStuffById(widget.id_barang).then((value) {
      setState(() {
        namaBarangController.text = value!.nama_barang;
        kondisiController.text = value.kondisi;
        sumberDanaController.text = value.sumber_dana;
        hargaController.text = value.harga.toString();
        jenisController.text = value.jenis;
        jumlahController.text = value.jumlah.toString();
      });
    }); // Panggil getStuffById di initState
  }

  @override
  Widget build(BuildContext context) {
    print('ID Barang : ${widget.id_barang}');

    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Detail Barang',
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

    Widget judulBarang() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
            color: const Color(0xffD8C4B6),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          namaBarangController.text,
          style: primaryTextStyle.copyWith(
              fontSize: 15, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget isiBarang() {
      return Container(
        width: double.infinity,
        height: 174,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: const Color(0xffD8C4B6),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Text(
              'Kondisi : ${kondisiController.text}',
              style: primaryTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Jumlah : ${jumlahController.text}',
              style: primaryTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Sumber Dana : ${sumberDanaController.text}',
              style: primaryTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Jenis : ${jenisController.text}',
              style: primaryTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Keterangan : -',
              style: primaryTextStyle.copyWith(
                  fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 52),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            judulBarang(),
            isiBarang(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgcolor1,
      appBar: header(),
      body: content(),
    );
  }
}
