// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart'; 

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nama_depanMeta =
      const VerificationMeta('nama_depan');
  @override
  late final GeneratedColumn<String> nama_depan = GeneratedColumn<String>(
      'nama_depan', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nama_belakangMeta =
      const VerificationMeta('nama_belakang');
  @override
  late final GeneratedColumn<String> nama_belakang = GeneratedColumn<String>(
      'nama_belakang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tgl_lahirMeta =
      const VerificationMeta('tgl_lahir');
  @override
  late final GeneratedColumn<DateTime> tgl_lahir = GeneratedColumn<DateTime>(
      'tgl_lahir', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        nama_depan,
        nama_belakang,
        tgl_lahir,
        email,
        password,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 'profiles';
  @override
  String get actualTableName => 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<Profile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('nama_depan')) {
      context.handle(
          _nama_depanMeta,
          nama_depan.isAcceptableOrUnknown(
              data['nama_depan']!, _nama_depanMeta));
    } else if (isInserting) {
      context.missing(_nama_depanMeta);
    }
    if (data.containsKey('nama_belakang')) {
      context.handle(
          _nama_belakangMeta,
          nama_belakang.isAcceptableOrUnknown(
              data['nama_belakang']!, _nama_belakangMeta));
    } else if (isInserting) {
      context.missing(_nama_belakangMeta);
    }
    if (data.containsKey('tgl_lahir')) {
      context.handle(_tgl_lahirMeta,
          tgl_lahir.isAcceptableOrUnknown(data['tgl_lahir']!, _tgl_lahirMeta));
    } else if (isInserting) {
      context.missing(_tgl_lahirMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      nama_depan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_depan'])!,
      nama_belakang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_belakang'])!,
      tgl_lahir: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}tgl_lahir'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String username;
  final String nama_depan;
  final String nama_belakang;
  final DateTime tgl_lahir;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Profile(
      {required this.id,
      required this.username,
      required this.nama_depan,
      required this.nama_belakang,
      required this.tgl_lahir,
      required this.email,
      required this.password,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['nama_depan'] = Variable<String>(nama_depan);
    map['nama_belakang'] = Variable<String>(nama_belakang);
    map['tgl_lahir'] = Variable<DateTime>(tgl_lahir);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      username: Value(username),
      nama_depan: Value(nama_depan),
      nama_belakang: Value(nama_belakang),
      tgl_lahir: Value(tgl_lahir),
      email: Value(email),
      password: Value(password),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      nama_depan: serializer.fromJson<String>(json['nama_depan']),
      nama_belakang: serializer.fromJson<String>(json['nama_belakang']),
      tgl_lahir: serializer.fromJson<DateTime>(json['tgl_lahir']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'nama_depan': serializer.toJson<String>(nama_depan),
      'nama_belakang': serializer.toJson<String>(nama_belakang),
      'tgl_lahir': serializer.toJson<DateTime>(tgl_lahir),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Profile copyWith(
          {int? id,
          String? username,
          String? nama_depan,
          String? nama_belakang,
          DateTime? tgl_lahir,
          String? email,
          String? password,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Profile(
        id: id ?? this.id,
        username: username ?? this.username,
        nama_depan: nama_depan ?? this.nama_depan,
        nama_belakang: nama_belakang ?? this.nama_belakang,
        tgl_lahir: tgl_lahir ?? this.tgl_lahir,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('nama_depan: $nama_depan, ')
          ..write('nama_belakang: $nama_belakang, ')
          ..write('tgl_lahir: $tgl_lahir, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, nama_depan, nama_belakang,
      tgl_lahir, email, password, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.username == this.username &&
          other.nama_depan == this.nama_depan &&
          other.nama_belakang == this.nama_belakang &&
          other.tgl_lahir == this.tgl_lahir &&
          other.email == this.email &&
          other.password == this.password &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> nama_depan;
  final Value<String> nama_belakang;
  final Value<DateTime> tgl_lahir;
  final Value<String> email;
  final Value<String> password;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.nama_depan = const Value.absent(),
    this.nama_belakang = const Value.absent(),
    this.tgl_lahir = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String nama_depan,
    required String nama_belakang,
    required DateTime tgl_lahir,
    required String email,
    required String password,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : username = Value(username),
        nama_depan = Value(nama_depan),
        nama_belakang = Value(nama_belakang),
        tgl_lahir = Value(tgl_lahir),
        email = Value(email),
        password = Value(password),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Profile> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? nama_depan,
    Expression<String>? nama_belakang,
    Expression<DateTime>? tgl_lahir,
    Expression<String>? email,
    Expression<String>? password,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (nama_depan != null) 'nama_depan': nama_depan,
      if (nama_belakang != null) 'nama_belakang': nama_belakang,
      if (tgl_lahir != null) 'tgl_lahir': tgl_lahir,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? nama_depan,
      Value<String>? nama_belakang,
      Value<DateTime>? tgl_lahir,
      Value<String>? email,
      Value<String>? password,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      nama_depan: nama_depan ?? this.nama_depan,
      nama_belakang: nama_belakang ?? this.nama_belakang,
      tgl_lahir: tgl_lahir ?? this.tgl_lahir,
      email: email ?? this.email,
      password: password ?? this.password,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (nama_depan.present) {
      map['nama_depan'] = Variable<String>(nama_depan.value);
    }
    if (nama_belakang.present) {
      map['nama_belakang'] = Variable<String>(nama_belakang.value);
    }
    if (tgl_lahir.present) {
      map['tgl_lahir'] = Variable<DateTime>(tgl_lahir.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('nama_depan: $nama_depan, ')
          ..write('nama_belakang: $nama_belakang, ')
          ..write('tgl_lahir: $tgl_lahir, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $GoodsTable extends Goods with TableInfo<$GoodsTable, Stuff> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nama_barangMeta =
      const VerificationMeta('nama_barang');
  @override
  late final GeneratedColumn<String> nama_barang = GeneratedColumn<String>(
      'nama_barang', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kondisiMeta =
      const VerificationMeta('kondisi');
  @override
  late final GeneratedColumn<String> kondisi = GeneratedColumn<String>(
      'kondisi', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sumber_danaMeta =
      const VerificationMeta('sumber_dana');
  @override
  late final GeneratedColumn<String> sumber_dana = GeneratedColumn<String>(
      'sumber_dana', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hargaMeta = const VerificationMeta('harga');
  @override
  late final GeneratedColumn<int> harga = GeneratedColumn<int>(
      'harga', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jenisMeta = const VerificationMeta('jenis');
  @override
  late final GeneratedColumn<String> jenis = GeneratedColumn<String>(
      'jenis', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
      'jumlah', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nama_barang,
        kondisi,
        sumber_dana,
        harga,
        jenis,
        jumlah,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 'goods';
  @override
  String get actualTableName => 'goods';
  @override
  VerificationContext validateIntegrity(Insertable<Stuff> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_barang')) {
      context.handle(
          _nama_barangMeta,
          nama_barang.isAcceptableOrUnknown(
              data['nama_barang']!, _nama_barangMeta));
    } else if (isInserting) {
      context.missing(_nama_barangMeta);
    }
    if (data.containsKey('kondisi')) {
      context.handle(_kondisiMeta,
          kondisi.isAcceptableOrUnknown(data['kondisi']!, _kondisiMeta));
    } else if (isInserting) {
      context.missing(_kondisiMeta);
    }
    if (data.containsKey('sumber_dana')) {
      context.handle(
          _sumber_danaMeta,
          sumber_dana.isAcceptableOrUnknown(
              data['sumber_dana']!, _sumber_danaMeta));
    } else if (isInserting) {
      context.missing(_sumber_danaMeta);
    }
    if (data.containsKey('harga')) {
      context.handle(
          _hargaMeta, harga.isAcceptableOrUnknown(data['harga']!, _hargaMeta));
    } else if (isInserting) {
      context.missing(_hargaMeta);
    }
    if (data.containsKey('jenis')) {
      context.handle(
          _jenisMeta, jenis.isAcceptableOrUnknown(data['jenis']!, _jenisMeta));
    } else if (isInserting) {
      context.missing(_jenisMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(_jumlahMeta,
          jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta));
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stuff map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stuff(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nama_barang: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nama_barang'])!,
      kondisi: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kondisi'])!,
      sumber_dana: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sumber_dana'])!,
      harga: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}harga'])!,
      jenis: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}jenis'])!,
      jumlah: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jumlah'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $GoodsTable createAlias(String alias) {
    return $GoodsTable(attachedDatabase, alias);
  }
}

class Stuff extends DataClass implements Insertable<Stuff> {
  final int id;
  final String nama_barang;
  final String kondisi;
  final String sumber_dana;
  final int harga;
  final String jenis;
  final int jumlah;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Stuff(
      {required this.id,
      required this.nama_barang,
      required this.kondisi,
      required this.sumber_dana,
      required this.harga,
      required this.jenis,
      required this.jumlah,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_barang'] = Variable<String>(nama_barang);
    map['kondisi'] = Variable<String>(kondisi);
    map['sumber_dana'] = Variable<String>(sumber_dana);
    map['harga'] = Variable<int>(harga);
    map['jenis'] = Variable<String>(jenis);
    map['jumlah'] = Variable<int>(jumlah);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  GoodsCompanion toCompanion(bool nullToAbsent) {
    return GoodsCompanion(
      id: Value(id),
      nama_barang: Value(nama_barang),
      kondisi: Value(kondisi),
      sumber_dana: Value(sumber_dana),
      harga: Value(harga),
      jenis: Value(jenis),
      jumlah: Value(jumlah),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Stuff.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stuff(
      id: serializer.fromJson<int>(json['id']),
      nama_barang: serializer.fromJson<String>(json['nama_barang']),
      kondisi: serializer.fromJson<String>(json['kondisi']),
      sumber_dana: serializer.fromJson<String>(json['sumber_dana']),
      harga: serializer.fromJson<int>(json['harga']),
      jenis: serializer.fromJson<String>(json['jenis']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama_barang': serializer.toJson<String>(nama_barang),
      'kondisi': serializer.toJson<String>(kondisi),
      'sumber_dana': serializer.toJson<String>(sumber_dana),
      'harga': serializer.toJson<int>(harga),
      'jenis': serializer.toJson<String>(jenis),
      'jumlah': serializer.toJson<int>(jumlah),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Stuff copyWith(
          {int? id,
          String? nama_barang,
          String? kondisi,
          String? sumber_dana,
          int? harga,
          String? jenis,
          int? jumlah,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Stuff(
        id: id ?? this.id,
        nama_barang: nama_barang ?? this.nama_barang,
        kondisi: kondisi ?? this.kondisi,
        sumber_dana: sumber_dana ?? this.sumber_dana,
        harga: harga ?? this.harga,
        jenis: jenis ?? this.jenis,
        jumlah: jumlah ?? this.jumlah,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Stuff(')
          ..write('id: $id, ')
          ..write('nama_barang: $nama_barang, ')
          ..write('kondisi: $kondisi, ')
          ..write('sumber_dana: $sumber_dana, ')
          ..write('harga: $harga, ')
          ..write('jenis: $jenis, ')
          ..write('jumlah: $jumlah, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama_barang, kondisi, sumber_dana, harga,
      jenis, jumlah, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stuff &&
          other.id == this.id &&
          other.nama_barang == this.nama_barang &&
          other.kondisi == this.kondisi &&
          other.sumber_dana == this.sumber_dana &&
          other.harga == this.harga &&
          other.jenis == this.jenis &&
          other.jumlah == this.jumlah &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class GoodsCompanion extends UpdateCompanion<Stuff> {
  final Value<int> id;
  final Value<String> nama_barang;
  final Value<String> kondisi;
  final Value<String> sumber_dana;
  final Value<int> harga;
  final Value<String> jenis;
  final Value<int> jumlah;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const GoodsCompanion({
    this.id = const Value.absent(),
    this.nama_barang = const Value.absent(),
    this.kondisi = const Value.absent(),
    this.sumber_dana = const Value.absent(),
    this.harga = const Value.absent(),
    this.jenis = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  GoodsCompanion.insert({
    this.id = const Value.absent(),
    required String nama_barang,
    required String kondisi,
    required String sumber_dana,
    required int harga,
    required String jenis,
    required int jumlah,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : nama_barang = Value(nama_barang),
        kondisi = Value(kondisi),
        sumber_dana = Value(sumber_dana),
        harga = Value(harga),
        jenis = Value(jenis),
        jumlah = Value(jumlah),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Stuff> custom({
    Expression<int>? id,
    Expression<String>? nama_barang,
    Expression<String>? kondisi,
    Expression<String>? sumber_dana,
    Expression<int>? harga,
    Expression<String>? jenis,
    Expression<int>? jumlah,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama_barang != null) 'nama_barang': nama_barang,
      if (kondisi != null) 'kondisi': kondisi,
      if (sumber_dana != null) 'sumber_dana': sumber_dana,
      if (harga != null) 'harga': harga,
      if (jenis != null) 'jenis': jenis,
      if (jumlah != null) 'jumlah': jumlah,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  GoodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? nama_barang,
      Value<String>? kondisi,
      Value<String>? sumber_dana,
      Value<int>? harga,
      Value<String>? jenis,
      Value<int>? jumlah,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return GoodsCompanion(
      id: id ?? this.id,
      nama_barang: nama_barang ?? this.nama_barang,
      kondisi: kondisi ?? this.kondisi,
      sumber_dana: sumber_dana ?? this.sumber_dana,
      harga: harga ?? this.harga,
      jenis: jenis ?? this.jenis,
      jumlah: jumlah ?? this.jumlah,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama_barang.present) {
      map['nama_barang'] = Variable<String>(nama_barang.value);
    }
    if (kondisi.present) {
      map['kondisi'] = Variable<String>(kondisi.value);
    }
    if (sumber_dana.present) {
      map['sumber_dana'] = Variable<String>(sumber_dana.value);
    }
    if (harga.present) {
      map['harga'] = Variable<int>(harga.value);
    }
    if (jenis.present) {
      map['jenis'] = Variable<String>(jenis.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoodsCompanion(')
          ..write('id: $id, ')
          ..write('nama_barang: $nama_barang, ')
          ..write('kondisi: $kondisi, ')
          ..write('sumber_dana: $sumber_dana, ')
          ..write('harga: $harga, ')
          ..write('jenis: $jenis, ')
          ..write('jumlah: $jumlah, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $BorrowsTable extends Borrows with TableInfo<$BorrowsTable, Borrow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BorrowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _id_barangMeta =
      const VerificationMeta('id_barang');
  @override
  late final GeneratedColumn<int> id_barang = GeneratedColumn<int>(
      'id_barang', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _id_profileMeta =
      const VerificationMeta('id_profile');
  @override
  late final GeneratedColumn<int> id_profile = GeneratedColumn<int>(
      'id_profile', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tgl_pinjamMeta =
      const VerificationMeta('tgl_pinjam');
  @override
  late final GeneratedColumn<DateTime> tgl_pinjam = GeneratedColumn<DateTime>(
      'tgl_pinjam', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _tgl_kembaliMeta =
      const VerificationMeta('tgl_kembali');
  @override
  late final GeneratedColumn<DateTime> tgl_kembali = GeneratedColumn<DateTime>(
      'tgl_kembali', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        id_barang,
        id_profile,
        tgl_pinjam,
        tgl_kembali,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 'borrows';
  @override
  String get actualTableName => 'borrows';
  @override
  VerificationContext validateIntegrity(Insertable<Borrow> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_barang')) {
      context.handle(_id_barangMeta,
          id_barang.isAcceptableOrUnknown(data['id_barang']!, _id_barangMeta));
    } else if (isInserting) {
      context.missing(_id_barangMeta);
    }
    if (data.containsKey('id_profile')) {
      context.handle(
          _id_profileMeta,
          id_profile.isAcceptableOrUnknown(
              data['id_profile']!, _id_profileMeta));
    } else if (isInserting) {
      context.missing(_id_profileMeta);
    }
    if (data.containsKey('tgl_pinjam')) {
      context.handle(
          _tgl_pinjamMeta,
          tgl_pinjam.isAcceptableOrUnknown(
              data['tgl_pinjam']!, _tgl_pinjamMeta));
    } else if (isInserting) {
      context.missing(_tgl_pinjamMeta);
    }
    if (data.containsKey('tgl_kembali')) {
      context.handle(
          _tgl_kembaliMeta,
          tgl_kembali.isAcceptableOrUnknown(
              data['tgl_kembali']!, _tgl_kembaliMeta));
    } else if (isInserting) {
      context.missing(_tgl_kembaliMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Borrow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Borrow(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      id_barang: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_barang'])!,
      id_profile: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id_profile'])!,
      tgl_pinjam: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}tgl_pinjam'])!,
      tgl_kembali: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}tgl_kembali'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $BorrowsTable createAlias(String alias) {
    return $BorrowsTable(attachedDatabase, alias);
  }
}

class Borrow extends DataClass implements Insertable<Borrow> {
  final int id;
  final int id_barang;
  final int id_profile;
  final DateTime tgl_pinjam;
  final DateTime tgl_kembali;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const Borrow(
      {required this.id,
      required this.id_barang,
      required this.id_profile,
      required this.tgl_pinjam,
      required this.tgl_kembali,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_barang'] = Variable<int>(id_barang);
    map['id_profile'] = Variable<int>(id_profile);
    map['tgl_pinjam'] = Variable<DateTime>(tgl_pinjam);
    map['tgl_kembali'] = Variable<DateTime>(tgl_kembali);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  BorrowsCompanion toCompanion(bool nullToAbsent) {
    return BorrowsCompanion(
      id: Value(id),
      id_barang: Value(id_barang),
      id_profile: Value(id_profile),
      tgl_pinjam: Value(tgl_pinjam),
      tgl_kembali: Value(tgl_kembali),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory Borrow.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Borrow(
      id: serializer.fromJson<int>(json['id']),
      id_barang: serializer.fromJson<int>(json['id_barang']),
      id_profile: serializer.fromJson<int>(json['id_profile']),
      tgl_pinjam: serializer.fromJson<DateTime>(json['tgl_pinjam']),
      tgl_kembali: serializer.fromJson<DateTime>(json['tgl_kembali']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'id_barang': serializer.toJson<int>(id_barang),
      'id_profile': serializer.toJson<int>(id_profile),
      'tgl_pinjam': serializer.toJson<DateTime>(tgl_pinjam),
      'tgl_kembali': serializer.toJson<DateTime>(tgl_kembali),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  Borrow copyWith(
          {int? id,
          int? id_barang,
          int? id_profile,
          DateTime? tgl_pinjam,
          DateTime? tgl_kembali,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      Borrow(
        id: id ?? this.id,
        id_barang: id_barang ?? this.id_barang,
        id_profile: id_profile ?? this.id_profile,
        tgl_pinjam: tgl_pinjam ?? this.tgl_pinjam,
        tgl_kembali: tgl_kembali ?? this.tgl_kembali,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Borrow(')
          ..write('id: $id, ')
          ..write('id_barang: $id_barang, ')
          ..write('id_profile: $id_profile, ')
          ..write('tgl_pinjam: $tgl_pinjam, ')
          ..write('tgl_kembali: $tgl_kembali, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, id_barang, id_profile, tgl_pinjam,
      tgl_kembali, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Borrow &&
          other.id == this.id &&
          other.id_barang == this.id_barang &&
          other.id_profile == this.id_profile &&
          other.tgl_pinjam == this.tgl_pinjam &&
          other.tgl_kembali == this.tgl_kembali &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class BorrowsCompanion extends UpdateCompanion<Borrow> {
  final Value<int> id;
  final Value<int> id_barang;
  final Value<int> id_profile;
  final Value<DateTime> tgl_pinjam;
  final Value<DateTime> tgl_kembali;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const BorrowsCompanion({
    this.id = const Value.absent(),
    this.id_barang = const Value.absent(),
    this.id_profile = const Value.absent(),
    this.tgl_pinjam = const Value.absent(),
    this.tgl_kembali = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  BorrowsCompanion.insert({
    this.id = const Value.absent(),
    required int id_barang,
    required int id_profile,
    required DateTime tgl_pinjam,
    required DateTime tgl_kembali,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : id_barang = Value(id_barang),
        id_profile = Value(id_profile),
        tgl_pinjam = Value(tgl_pinjam),
        tgl_kembali = Value(tgl_kembali),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Borrow> custom({
    Expression<int>? id,
    Expression<int>? id_barang,
    Expression<int>? id_profile,
    Expression<DateTime>? tgl_pinjam,
    Expression<DateTime>? tgl_kembali,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (id_barang != null) 'id_barang': id_barang,
      if (id_profile != null) 'id_profile': id_profile,
      if (tgl_pinjam != null) 'tgl_pinjam': tgl_pinjam,
      if (tgl_kembali != null) 'tgl_kembali': tgl_kembali,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  BorrowsCompanion copyWith(
      {Value<int>? id,
      Value<int>? id_barang,
      Value<int>? id_profile,
      Value<DateTime>? tgl_pinjam,
      Value<DateTime>? tgl_kembali,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return BorrowsCompanion(
      id: id ?? this.id,
      id_barang: id_barang ?? this.id_barang,
      id_profile: id_profile ?? this.id_profile,
      tgl_pinjam: tgl_pinjam ?? this.tgl_pinjam,
      tgl_kembali: tgl_kembali ?? this.tgl_kembali,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (id_barang.present) {
      map['id_barang'] = Variable<int>(id_barang.value);
    }
    if (id_profile.present) {
      map['id_profile'] = Variable<int>(id_profile.value);
    }
    if (tgl_pinjam.present) {
      map['tgl_pinjam'] = Variable<DateTime>(tgl_pinjam.value);
    }
    if (tgl_kembali.present) {
      map['tgl_kembali'] = Variable<DateTime>(tgl_kembali.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BorrowsCompanion(')
          ..write('id: $id, ')
          ..write('id_barang: $id_barang, ')
          ..write('id_profile: $id_profile, ')
          ..write('tgl_pinjam: $tgl_pinjam, ')
          ..write('tgl_kembali: $tgl_kembali, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $GoodsTable goods = $GoodsTable(this);
  late final $BorrowsTable borrows = $BorrowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [profiles, goods, borrows];
}
