import 'package:drift/drift.dart';

@DataClassName('Borrow')
class Borrows extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get id_barang => integer()();
  IntColumn get id_profile => integer()();
  DateTimeColumn get tgl_pinjam => dateTime()();
  DateTimeColumn get tgl_kembali => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();


}
