import 'package:flutter/material.dart';
// import 'package:stock_ops/beranda.dart';
import '../home/profile_page.dart';
import 'beranda.dart';
// import 'package:stock_ops/detil_barang_pinjam.dart';
import 'detil_barang_pinjam.dart';
// import 'package:stock_ops/transaksi_pinjam.dart';
import 'transaksi_pinjam.dart';

class BottomBar extends StatefulWidget {
  final int currentPage;
  const BottomBar({super.key, required this.currentPage});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  int selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      // Navigator.pushNamed(context, destination);
      selectedPage = index;
      if (selectedPage == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Beranda()),
        );
      } else if (selectedPage == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const TransaksiPinjam();
            },
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilPage()),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(79, 112, 156, 1),
      selectedItemColor: Color.fromARGB(255, 255, 255, 255),
      unselectedItemColor: Color.fromARGB(166, 255, 255, 255),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      mouseCursor: SystemMouseCursors.click,
      currentIndex: widget.currentPage,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 25,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            size: 25,
          ),
          label: "Tambah",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_3,
            size: 25,
          ),
          label: "Profile",
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
