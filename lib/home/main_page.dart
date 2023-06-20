import 'package:flutter/material.dart';
import 'package:stock_ops/home/home_daftar_barang.dart';
import 'package:stock_ops/home/profile_page.dart';
import 'package:stock_ops/home/tambah_barang.dart';
import 'package:stock_ops/theme/theme.dart';




class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: const  BorderRadius.vertical(
          top: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: primaryColor,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/icons/icon_home.png',
                  width: 20,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/icons/icon_tambah.png',
                  width: 41,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/icons/icon_profile.png',
                  width: 20,
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomeDaftarBarangPage();
          break;
        case 1:
          return TambahBarangPage();
          break;
        case 2:
          return ProfilPage();
          break;
        default:
          return HomeDaftarBarangPage();
      }
    }

    return Scaffold(
      backgroundColor: bgcolor1,
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}