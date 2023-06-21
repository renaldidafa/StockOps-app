import 'package:flutter/material.dart';
// import 'package:stock_ops/navigasi_bar.dart';
// import 'package:stock_ops/transaksi_pinjam.dart';

import '../data/models/database.dart';
import 'navigasi_bar.dart';

// import 'navigasi_bar.dart';

class Beranda extends StatefulWidget {
  final int? id_profil;
  const Beranda({Key? key, required this.id_profil});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final AppDb database = AppDb();

  TextEditingController nama_depanController = TextEditingController();

  // untuk memanggil function di database.dart yang telah dibuat
  Future<List<Stuff>> getAllStuff() async {
    return await database.getAllStuffRepo();
  }

  // Mengambil profile dengan id tertentu
  Future<Profile?> getProfileById(int? id) async {
    if (id != null) {
      return await database.getProfileByIdRepo(id);
    } else {
      return null;
    }
  }

  // akhir mengambil profile dengan id tertentu

  Widget heading() {
    return Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Selamat Datang, ${nama_depanController.text}",
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
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
                // FutureBuilder<List<Stuff>>(
                //   future: getAllStuff(),
                //   builder: (context, snapshot) {
                //     // print('get');
                //     // if (snapshot.connectionState == ConnectionState.waiting) {
                //     //   return const CircularProgressIndicator();
                //     // } else if (snapshot.hasError) {
                //     //   return Text('Error: ${snapshot.error}');
                //     // } else {
                //     //   return Text(
                //     //     "${snapshot.data!.length}",
                //     //     style: const TextStyle(
                //     //       fontSize: 40,
                //     //       fontWeight: FontWeight.w700,
                //     //     ),
                //     //   );
                //     // }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // getAllStuff().then((value) {
    //   for (var barang in value) {
    //     print(barang);
    //   }
    // });
    int currentPageIndex = 0;
    // melihat id_profil
    // print("Nilai dari : ${widget.id_profil}");
    // Akhir melihat id_profil
    if (widget.id_profil != null) {
      // memanggil namanya saja untuk digantikan
      getProfileById(widget.id_profil!).then((value) {
        if (value != null) {
          setState(() {
            nama_depanController.text = value.nama_depan;
          });
        }
      });
    }
    // akhir memanggil nama saja
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
        child: ListView(
          children: [
            Column(
              children: [
                heading(),
                const SizedBox(
                  height: 40,
                ),
                konten("DAFTAR BARANG", '/home-page', context),
                konten("TOTAL BARANG MASUK", '/home-page', context),
                konten("PEMINJAMAN BELUM DIKEMBALIKAN", '/home-page', context),
                konten(
                    "TRANSAKSI PEMINJAMAN", '/transaksiPinjam-page', context),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentPage: currentPageIndex,
        id_profil: widget.id_profil!,
      ),
    );
  }
}
