import 'package:flutter/material.dart';
// import 'package:stock_ops/navigasi_bar.dart';
// import 'package:stock_ops/transaksi_pinjam.dart';

import '../data/models/database.dart';
import 'transaksi_pinjam.dart';
import 'navigasi_bar.dart';

// import 'navigasi_bar.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final AppDb database = AppDb();

  // untuk memanggil function di database.dart yang telah dibuat
  Future<List<Stuff>> getAllStuff() async {
    return await database.getAllStuffRepo();
  }

  Widget heading() {
    return Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selamat Datang, Alim",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          ),
        ));
  }

  Widget konten(String kategori, String destination, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      color: const Color.fromRGBO(216, 196, 182, 1),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: const DecorationImage(
            image: AssetImage("assets/tekstur/asfalt-dark.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, destination);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        kategori,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder<List<Stuff>>(
                    future: getAllStuff(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          "${snapshot.data!.length}",
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 239, 231, 1),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tekstur/fabric-of-squares.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            heading(),
            const SizedBox(
              height: 40,
            ),
            konten("DAFTAR BARANG", '/home-page', context),
            konten("TOTAL BARANG MASUK", '/home-page', context),
            konten("PEMINJAMAN BELUM DIKEMBALIKAN", '/home-page', context),
            konten("TRANSAKSI PEMINJAMAN", '/transaksiPinjam-page', context),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/tekstur/buried.png"),
      //     ),
      //   ),
      //   child: BottomNavigation(),
      // ),
      bottomNavigationBar: BottomBar(
        currentPage: currentPageIndex,
      ),
    );
  }
}
