import 'package:flutter/material.dart';
import 'package:stock_ops/theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    Widget textTop() {
      return SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'StockOps',
            style: primaryTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    Widget inputNama() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 66),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
            hintText: 'Username',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your username';
            }
            return null;
          },
          onSaved: (value) {
            _username = value!;
          },
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          obscureText: !_isPasswordVisible,
          onChanged: (value) {
            setState(() {
              _password = value;
            });
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
            hintText: 'Password',
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: _isPasswordVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          onSaved: (value) {
            _password = value!;
          },
        ),
      );
    }

    Widget button() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 24),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Lakukan validasi login dengan mengirimkan data username dan password ke backend atau melakukan pengecekan secara lokal.
              Navigator.pushNamedAndRemoveUntil(
                  context, '/beranda-page', (route) => false);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Login'),
                    content: const Text('keren'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Tutup'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: Text(
            'Login',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    Widget textBottom() {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun?',
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff4F709C),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register-page');
              },
              child: Text(
                'Daftar',
                style: primaryTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor1,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 58),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    textTop(),
                    inputNama(),
                    inputPassword(),
                    button(),
                    textBottom(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
