import 'package:moor/moor.dart';

class BloodSugarEntity extends Table {
  IntColumn get bloodSugar => integer()();
  TextColumn get measureState => text()();
  DateTimeColumn get measureTime => dateTime()();

}