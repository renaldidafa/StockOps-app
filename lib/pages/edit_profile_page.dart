import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:stock_ops/theme/theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  //Fungsi untuk edit profile
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      setState(() {
        _imageFile = imageFile;
      });
    }
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
  final _formKey = GlobalKey<FormState>();
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
          'Edit profile',
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

    Widget inputJabatan() {
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
            hintText: 'Posisi',
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'tolong isi Posisi';
            }
            return null;
          },
          onSaved: (value) {
            _email = value!;
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
              Navigator.pushNamed(context, '/editProfile-page');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Berhasil Edit profile'),
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
            'Simpan',
            style: primaryTextStyleButton.copyWith(
                fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
      );
    }

    Widget profileFoto() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                if (_imageFile != null)
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(_imageFile!),
                  ),
                ClipOval(
                  child: Container(
                    color: Colors.grey.withOpacity(0.5),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        // Tambahkan logika untuk aksi edit
                        _pickImage();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor1,
        bottomNavigationBar: button(),
        appBar: header(),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 44),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    profileFoto(),
                    inputNama(),
                    inputNamaDepan(),
                    inputNamaBelakang(),
                    inputTanggalLahir(),
                    inputJabatan(),
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
