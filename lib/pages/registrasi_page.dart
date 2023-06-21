import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_ops/data/models/database.dart';
import 'package:stock_ops/theme/theme.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({super.key});

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();

  //connecting database
  final AppDb database = AppDb();

  // Insert data
  // Membuat textEditingController untuk mengambil inputan dari user
  TextEditingController usernameController = TextEditingController();
  TextEditingController nama_depanController = TextEditingController();
  TextEditingController nama_belakangController = TextEditingController();
  TextEditingController tgl_lahirController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // akhir dari controller

  // melakukan insert kedalam database
  Future insert(String username, String nama_depan, String nama_belakang,
      String tgl_lahir, String email, String password) async {
    final createdAt = DateTime.now();
    final updatedAt = DateTime.now();
    final DateTime parsedTglLahir = DateTime.parse(tgl_lahir as String);
    final row = await database.into(database.profiles).insertReturning(
          ProfilesCompanion.insert(
              username: username,
              nama_depan: nama_depan,
              nama_belakang: nama_belakang,
              tgl_lahir: parsedTglLahir,
              email: email,
              password: password,
              createdAt: createdAt,
              updatedAt: updatedAt),
        );
    print(row);
  }

  //bikin variabel datetime untuk bikin dinamis text tanggal
  // DateTime _dateTime = DateTime.now();

  // fungsi untuk menampilkan tanggal
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          tgl_lahirController.text = value.toString();
        });
      }
    });
  }

  // fungsi untuk merapihkan tulisan format tanggal hari,tanggal hari,bulan dan tahun
  String _formatDateTime(DateTime? dateTime) {
    if (dateTime != null) {
      final formattedDate =
          DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(dateTime);
      return formattedDate;
    }
    return ' ';
  }

  bool _isPasswordVisible = false;
  bool _isPasswordKonfirVisible = false;
  String _username = '';
  String _password = '';
  String _namaDepan = '';
  String _namaBelakang = '';
  String _tanggalLahir = '';
  String _email = '';
  String _konfirmPassword = '';
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Daftar',
          style: primaryTextStyleButton.copyWith(
              fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryTextButton,
          ),
        ),
      );
    }

    Widget inputNama() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: usernameController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Username',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi username';
            }
            return null;
          },
          onSaved: (value) {
            _username = value!;
          },
        ),
      );
    }

    Widget inputNamaDepan() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: nama_depanController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Nama Depan',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Nama Depan';
            }
            return null;
          },
          onSaved: (value) {
            _namaDepan = value!;
          },
        ),
      );
    }

    Widget inputNamaBelakang() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: nama_belakangController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Nama Belakang',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Nama Belakang';
            }
            return null;
          },
          onSaved: (value) {
            _namaBelakang = value!;
          },
        ),
      );
    }

    Widget inputTanggalLahir() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 9),
        padding: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: tgl_lahirController,
                readOnly: true,
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
                decoration: const InputDecoration(
                  hintText: 'Tanggal Lahir',
                  border: InputBorder.none,
                ),
              ),
              // child: Text(
              //   _formatDateTime(tgl_lahirController as DateTime?),
              //   style: primaryTextStyle.copyWith(
              //       fontSize: 14, fontWeight: FontWeight.w400),
              // ),
            ),
            IconButton(
              onPressed: _showDatePicker,
              icon: const Icon(Icons.date_range),
            )
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 19,
        ),
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          controller: emailController,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Email';
            }
            return null;
          },
          onSaved: (value) {
            _email = value!;
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
          // Controller untuk password
          controller: passwordController,
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
        margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // melakukan input data
              insert(
                  usernameController.text,
                  nama_depanController.text,
                  nama_belakangController.text,
                  tgl_lahirController.text,
                  emailController.text,
                  passwordController.text);
              // Lakukan validasi login dengan mengirimkan data username dan password ke backend atau melakukan pengecekan secara lokal.
              Navigator.pushNamed(context, '/login-page');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Daftar'),
                    content: const Text('keren'),
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
            }
          },
          child: Text(
            'Daftar',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: button(),
        appBar: header(),
        backgroundColor: bgcolor1,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 44),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    inputNama(),
                    inputNamaDepan(),
                    inputNamaBelakang(),
                    inputTanggalLahir(),
                    inputEmail(),
                    inputPassword(),
                    // inputKonfirPass(),
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
