import 'package:flutter/material.dart';
import 'package:stock_ops/pages/beranda.dart';
import 'package:stock_ops/theme/theme.dart';

import '../data/models/database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // memanggil database
  final AppDb database = AppDb();

  // memanggil tabel profile atau mungkin fetching
  Future<List<Profile>> getAllProfile() async {
    return await database.getAllProfileRepo();
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  int? idProfil;
  @override
  Widget build(BuildContext context) {
    // untuk melihat hasil dari list pada tabel  profiles
    // melakukan debug
    getAllProfile().then((listOfProfiles) {
      // menampilkan semua nilai pada listOfStuff
      for (var profile in listOfProfiles) {
        print(profile);
      }
    }).catchError((error) {
      print('Terjadi error : $error');
    });

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
              getAllProfile().then((listOfProfiles) {
                bool isUsernameValid = false;
                bool isPasswordValid = false;

                for (var profile in listOfProfiles) {
                  // Cek jika username ada pada database
                  if (_username == profile.username) {
                    isUsernameValid = true;
                    // cek password yang ada pada username tersebut
                    if (_password == profile.password) {
                      isPasswordValid = true;
                      break;
                    }
                  }
                }

                if (isUsernameValid && isPasswordValid) {
                  Profile? validatedProfile;
                  for (var profile in listOfProfiles) {
                    if (_username == profile.username) {
                      validatedProfile = profile;
                      break;
                    }
                  }

                  if (validatedProfile != null) {
                    idProfil = validatedProfile.id;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Beranda(id_profil: idProfil!),
                      ),
                      (route) => false,
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Berhasil Login'),
                          content: const Text('Selamat datang!'),
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
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Gagal Login'),
                        content: const Text('Username atau password salah'),
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
              }).catchError((error) {
                print('Terjadi error: $error');
              });
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
