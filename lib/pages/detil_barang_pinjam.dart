import 'package:flutter/material.dart';
// import 'package:stock_ops/navigasi_bar.dart';
import 'navigasi_bar.dart';

class DetilPinjam extends StatelessWidget {
  const DetilPinjam({super.key});

  PreferredSizeWidget heading() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(79, 112, 156, 1),
      title: const Text(
        "Detil Barang Dipinjam",
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

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 2;
    return Scaffold(
      appBar: heading(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tekstur/fabric-of-squares.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  // margin: EdgeInsets.symmetric(vertical: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromRGBO(216, 196, 182, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const Text(
                    'Kursi Besi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color.fromRGBO(216, 196, 182, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      dataBarang('Dipinjam Oleh', 'Prodi Manajemen FEB'),
                      dataBarang('Spesifikasi', 'Besi'),
                      dataBarang('Kondisi', 'Baik'),
                      dataBarang('Jumlah Pinjam', '25 Pcs'),
                      dataBarang('Jenis', 'Sarana'),
                      dataBarang('Tanggal Pinjam', '06 Mei 2023'),
                      dataBarang('Tanggal Kembali', '08 Mei'),
                      dataBarang(
                          'Keterangan', 'Untuk Seminar Literasi Keuangan')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentPage: currentPageIndex,
        id_profil: null,
      ),
    );
  }

  Align dataBarang(String subject, String object) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Expanded(
          child: Text(
            "$subject \t: " "$object",
            textAlign: TextAlign.start,
            maxLines: 5,
          ),
        ),
      ),
    );
  }
}
