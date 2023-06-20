import 'package:drift/drift.dart';

@DataClassName('Profile')
class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(max: 50)();
  TextColumn get nama_depan => text()();
  TextColumn get nama_belakang => text()();
  DateTimeColumn get tgl_lahir => dateTime()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();


}
