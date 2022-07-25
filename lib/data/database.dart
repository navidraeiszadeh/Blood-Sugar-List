import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/data/blood_sugar.dao.dart';
import 'package:untitled/data/blood_sugar.entity.dart';

part 'database.g.dart' ;

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.v0.sqlite'));
    VmDatabase vmDatabase = VmDatabase(file);
    vmDatabase.logStatements = true;
    return vmDatabase;
  });
}

@UseMoor(
  tables: [BloodSugarEntity],
  daos: [BloodSugarDao]
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}


