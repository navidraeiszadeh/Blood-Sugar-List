// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BloodSugarEntityData extends DataClass
    implements Insertable<BloodSugarEntityData> {
  final int bloodSugar;
  final String measureState;
  final DateTime measureTime;
  BloodSugarEntityData(
      {required this.bloodSugar,
      required this.measureState,
      required this.measureTime});
  factory BloodSugarEntityData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BloodSugarEntityData(
      bloodSugar: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}blood_sugar'])!,
      measureState: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}measure_state'])!,
      measureTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}measure_time'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['blood_sugar'] = Variable<int>(bloodSugar);
    map['measure_state'] = Variable<String>(measureState);
    map['measure_time'] = Variable<DateTime>(measureTime);
    return map;
  }

  BloodSugarEntityCompanion toCompanion(bool nullToAbsent) {
    return BloodSugarEntityCompanion(
      bloodSugar: Value(bloodSugar),
      measureState: Value(measureState),
      measureTime: Value(measureTime),
    );
  }

  factory BloodSugarEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BloodSugarEntityData(
      bloodSugar: serializer.fromJson<int>(json['bloodSugar']),
      measureState: serializer.fromJson<String>(json['measureState']),
      measureTime: serializer.fromJson<DateTime>(json['measureTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bloodSugar': serializer.toJson<int>(bloodSugar),
      'measureState': serializer.toJson<String>(measureState),
      'measureTime': serializer.toJson<DateTime>(measureTime),
    };
  }

  BloodSugarEntityData copyWith(
          {int? bloodSugar, String? measureState, DateTime? measureTime}) =>
      BloodSugarEntityData(
        bloodSugar: bloodSugar ?? this.bloodSugar,
        measureState: measureState ?? this.measureState,
        measureTime: measureTime ?? this.measureTime,
      );
  @override
  String toString() {
    return (StringBuffer('BloodSugarEntityData(')
          ..write('bloodSugar: $bloodSugar, ')
          ..write('measureState: $measureState, ')
          ..write('measureTime: $measureTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bloodSugar, measureState, measureTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BloodSugarEntityData &&
          other.bloodSugar == this.bloodSugar &&
          other.measureState == this.measureState &&
          other.measureTime == this.measureTime);
}

class BloodSugarEntityCompanion extends UpdateCompanion<BloodSugarEntityData> {
  final Value<int> bloodSugar;
  final Value<String> measureState;
  final Value<DateTime> measureTime;
  const BloodSugarEntityCompanion({
    this.bloodSugar = const Value.absent(),
    this.measureState = const Value.absent(),
    this.measureTime = const Value.absent(),
  });
  BloodSugarEntityCompanion.insert({
    required int bloodSugar,
    required String measureState,
    required DateTime measureTime,
  })  : bloodSugar = Value(bloodSugar),
        measureState = Value(measureState),
        measureTime = Value(measureTime);
  static Insertable<BloodSugarEntityData> custom({
    Expression<int>? bloodSugar,
    Expression<String>? measureState,
    Expression<DateTime>? measureTime,
  }) {
    return RawValuesInsertable({
      if (bloodSugar != null) 'blood_sugar': bloodSugar,
      if (measureState != null) 'measure_state': measureState,
      if (measureTime != null) 'measure_time': measureTime,
    });
  }

  BloodSugarEntityCompanion copyWith(
      {Value<int>? bloodSugar,
      Value<String>? measureState,
      Value<DateTime>? measureTime}) {
    return BloodSugarEntityCompanion(
      bloodSugar: bloodSugar ?? this.bloodSugar,
      measureState: measureState ?? this.measureState,
      measureTime: measureTime ?? this.measureTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bloodSugar.present) {
      map['blood_sugar'] = Variable<int>(bloodSugar.value);
    }
    if (measureState.present) {
      map['measure_state'] = Variable<String>(measureState.value);
    }
    if (measureTime.present) {
      map['measure_time'] = Variable<DateTime>(measureTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodSugarEntityCompanion(')
          ..write('bloodSugar: $bloodSugar, ')
          ..write('measureState: $measureState, ')
          ..write('measureTime: $measureTime')
          ..write(')'))
        .toString();
  }
}

class $BloodSugarEntityTable extends BloodSugarEntity
    with TableInfo<$BloodSugarEntityTable, BloodSugarEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BloodSugarEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _bloodSugarMeta = const VerificationMeta('bloodSugar');
  @override
  late final GeneratedColumn<int?> bloodSugar = GeneratedColumn<int?>(
      'blood_sugar', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _measureStateMeta =
      const VerificationMeta('measureState');
  @override
  late final GeneratedColumn<String?> measureState = GeneratedColumn<String?>(
      'measure_state', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _measureTimeMeta =
      const VerificationMeta('measureTime');
  @override
  late final GeneratedColumn<DateTime?> measureTime =
      GeneratedColumn<DateTime?>('measure_time', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [bloodSugar, measureState, measureTime];
  @override
  String get aliasedName => _alias ?? 'blood_sugar_entity';
  @override
  String get actualTableName => 'blood_sugar_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<BloodSugarEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('blood_sugar')) {
      context.handle(
          _bloodSugarMeta,
          bloodSugar.isAcceptableOrUnknown(
              data['blood_sugar']!, _bloodSugarMeta));
    } else if (isInserting) {
      context.missing(_bloodSugarMeta);
    }
    if (data.containsKey('measure_state')) {
      context.handle(
          _measureStateMeta,
          measureState.isAcceptableOrUnknown(
              data['measure_state']!, _measureStateMeta));
    } else if (isInserting) {
      context.missing(_measureStateMeta);
    }
    if (data.containsKey('measure_time')) {
      context.handle(
          _measureTimeMeta,
          measureTime.isAcceptableOrUnknown(
              data['measure_time']!, _measureTimeMeta));
    } else if (isInserting) {
      context.missing(_measureTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  BloodSugarEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BloodSugarEntityData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BloodSugarEntityTable createAlias(String alias) {
    return $BloodSugarEntityTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $BloodSugarEntityTable bloodSugarEntity =
      $BloodSugarEntityTable(this);
  late final BloodSugarDao bloodSugarDao = BloodSugarDao(this as AppDb);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bloodSugarEntity];
}
