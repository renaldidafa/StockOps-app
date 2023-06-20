import 'package:flutter/material.dart';
import 'package:stock_ops/theme/theme.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Profile',
          style: primaryTextStyleButton.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/beranda-page');
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextButton,
          ),
        ),
      );
    }

    Widget cardUser() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/editProfile-page');
        },
        child: Container(
          width: double.infinity,
          height: 145,
          padding: const EdgeInsets.only(left: 14, top: 20),
          decoration: BoxDecoration(
            color: const Color(0xffD8C4B6),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  width: 91,
                  height: 91,
                ),
              ),
              const SizedBox(
                width: 26,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      'Muhammad Alim Hidayat',
                      maxLines: 2,
                      style: primaryTextStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'alimhidayat@gmail.com',
                    maxLines: 2,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Staff Lab',
                    maxLines: 2,
                    style: primaryTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget button() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login-page');
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Berhasil Logout'),
                  content: const Text(':('),
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
          },
          child: Text(
            'Logout',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 33, vertical: 38),
        child: ListView(
          children: [
            cardUser(),
            button(),
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
