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
  TextEditingController username = TextEditingController();
  TextEditingController nama_depan = TextEditingController();
  TextEditingController nama_belakang = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // akhir dari controller

  // melakukan insert kedalam database 
  Future insert(String username, String nama_depan, String nama_belakang,
      String tgl_lahir, String email, String password) async {
    final createdAt = DateTime.now();
    final updatedAt = DateTime.now();
  }

  //bikin variabel datetime untuk bikin dinamis text tanggal
  DateTime _dateTime = DateTime.now();

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
          _dateTime = value;
        });
      }
    });
  }

  // fungsi untuk merapihkan tulisan format tanggal hari,tanggal hari,bulan dan tahun
  String _formatDateTime(DateTime dateTime) {
    final formattedDate =
        DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(dateTime);
    return formattedDate;
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
              child: Text(
                _formatDateTime(_dateTime),
                style: primaryTextStyle.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
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

    Widget inputKonfirPass() {
      return Container(
        margin: const EdgeInsets.only(top: 9),
        decoration: BoxDecoration(
          color: bgcolor2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          obscureText: !_isPasswordKonfirVisible,
          onChanged: (value) {
            setState(() {
              _konfirmPassword = value;
            });
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
            hintText: 'Konfirmasi Password',
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordKonfirVisible = !_isPasswordKonfirVisible;
                });
              },
              icon: _isPasswordKonfirVisible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your konfirmasi password';
            }
            return null;
          },
          onSaved: (value) {
            _konfirmPassword = value!;
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
                    inputKonfirPass(),
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
