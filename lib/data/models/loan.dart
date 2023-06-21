import 'package:drift/drift.dart';

@DataClassName('Loan')
class Loans extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get peminjam => text().withLength(max: 255)();
  TextColumn get spesifikasi => text().withLength(max: 255)();
  TextColumn get kondisi => text().withLength(max: 255)();
  IntColumn get jumlah => integer()();
  TextColumn get jenis => text().withLength(max: 255)();
  DateTimeColumn get tglPinjam => dateTime()();
  DateTimeColumn get tglKembali => dateTime()();
  TextColumn get keterangan => text()();
  IntColumn get stuff_id => integer()();

  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
