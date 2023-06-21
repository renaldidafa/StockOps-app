import 'package:flutter/material.dart';
// import 'package:stock_ops/detil_barang_pinjam.dart';
import 'detil_barang_pinjam.dart';

import 'navigasi_bar.dart';

class TransaksiPinjam extends StatefulWidget {
  const TransaksiPinjam({Key? key}) : super(key: key);

  @override
  State<TransaksiPinjam> createState() => _TransaksiPinjamState();
}

class _TransaksiPinjamState extends State<TransaksiPinjam> {
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

  Widget konten(String objek, Widget destination) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  objek,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                    ),
                  ),
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => destination),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 1;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 239, 231, 1),
      appBar: heading(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/tekstur/fabric-of-squares.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              // margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),

              // padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  konten("Kursi", const DetilPinjam()),
                  konten("Meja", const DetilPinjam()),
                  konten("Proyektor", const DetilPinjam()),
                  konten("Spidol", const DetilPinjam()),
                  konten("Monitor", const DetilPinjam()),
                  konten("Speaker", const DetilPinjam())
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentPage: currentPageIndex, id_profil: null,
      ),
    );
  }
}
