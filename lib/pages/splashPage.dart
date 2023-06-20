import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_ops/theme/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/login-page'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor1,
      body: Center(
        child: Text(
          'StockOps',
          style: primaryTextStyle.copyWith(
              fontSize: 36, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
