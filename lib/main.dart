import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stock_ops/home/main_page.dart';
import 'package:stock_ops/pages/detail_barang_page.dart';
import 'package:stock_ops/pages/detil_barang_pinjam.dart';
import 'package:stock_ops/pages/edit_barang_page.dart';
import 'package:stock_ops/pages/edit_profile_page.dart';
import 'package:stock_ops/pages/login_page.dart';
import 'package:stock_ops/pages/registrasi_page.dart';
import 'package:stock_ops/pages/splashPage.dart';

import 'package:stock_ops/pages/beranda.dart';
import 'package:stock_ops/pages/transaksi_pinjam.dart';

void main() async {
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        // path alim
        '/beranda-page': (context) => Beranda(),
        '/detilPinjam-page': (context) => const DetilPinjam(),
        '/transaksiPinjam-page': (context) => const TransaksiPinjam(),
        // end path alim
        '/home-page': (context) => const MainPage(),
        '/login-page': (context) => const LoginPage(),
        '/register-page': (context) => const RegistrasiPage(),
        // '/detailBarang-page': (context) => const DetailBarang(),
        // '/editBarang-page': (context) => const EditBarangPage(id_barang: null),
        '/editProfile-page': (context) => const EditProfilePage(),
      },
    );
  }
}
