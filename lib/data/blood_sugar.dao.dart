import 'package:moor/moor.dart';
import 'blood_sugar.entity.dart';
import 'blood_sugar.model.dart';
import 'database.dart';

part 'blood_sugar.dao.g.dart' ;

@UseDao(tables: [BloodSugarEntity])
class BloodSugarDao extends DatabaseAccessor<AppDb> with _$BloodSugarDaoMixin{
  BloodSugarDao (AppDb db) : super(db);

  Future insertBloodSugar (Blood blood) async => into(bloodSugarEntity).insert(convertModel(blood));

  Future<List<Blood>> watchBloodSugars() =>
     (select(bloodSugarEntity).map((bs) => convertEntity(bs)).get()) ;


  BloodSugarEntityData convertModel(Blood blood) => BloodSugarEntityData(
      bloodSugar: blood.bloodSugar,
      measureState: blood.measureState ,
      measureTime: blood.measureTime
    );

  Blood convertEntity(BloodSugarEntityData entity) => Blood (
      entity.bloodSugar,
      entity.measureState ,
      entity.measureTime
    );

}
