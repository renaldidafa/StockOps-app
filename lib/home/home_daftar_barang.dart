import 'package:flutter/material.dart';
import 'package:stock_ops/components/daftar_barang.dart';
// import 'package:stock_ops/pages/beranda.dart';
import 'package:stock_ops/theme/theme.dart';

class HomeDaftarBarangPage extends StatelessWidget {
  const HomeDaftarBarangPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Daftar Barang',
          style: primaryTextStyleButton.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // must resolve
            Navigator.pop(context);
            // specific path
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextButton,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 28),
        child: ListView(
          children: const [
            CardBarang(),
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
