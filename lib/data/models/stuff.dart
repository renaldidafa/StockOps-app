import 'package:drift/drift.dart';

@DataClassName('Stuff')
class Goods extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama_barang => text()();
  TextColumn get kondisi => text()();
  TextColumn get sumber_dana => text()();
  IntColumn get harga => integer()();
  TextColumn get jenis => text()();
  IntColumn get jumlah => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
