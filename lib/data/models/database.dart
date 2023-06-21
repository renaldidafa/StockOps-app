import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'borrow.dart';
import 'loan.dart';
import 'profile.dart';
import 'stuff.dart';

part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables: [Profiles, Goods, Borrows, Loans],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // query to get all goods from database
  Future<List<Stuff>> getAllStuffRepo() => select(goods).get();
  // query to get all profiles from database
  Future<List<Profile>> getAllProfileRepo() => select(profiles).get();

  // query to get a goods by the id for update on the database
  // ini belum jalan
  Future<Stuff?> getStuffByIdRepo(int id) {
    return (select(goods)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // query to get a profile by the id for calling the user
  Future<Profile?> getProfileByIdRepo(int id) {
    return (select(profiles)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // update database
  Future updateStuffRepo(int id, String nama_barang, String kondisi,
      String sumber_dana, int harga, String jenis, int jumlah) async {
    return (update(goods)..where((tbl) => tbl.id.equals(id))).write(
      GoodsCompanion(
        nama_barang: Value(nama_barang),
        kondisi: Value(kondisi),
        sumber_dana: Value(sumber_dana),
        harga: Value(harga),
        jenis: Value(jenis),
        jumlah: Value(jumlah),
      ),
    );
  }

  // Menghitung jumlah data yang ada pada tabel barang
  Future<int> countStuffRepo() =>
      select(goods).get().then((value) => value.length);

  // Melakukan insert / register table user
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
