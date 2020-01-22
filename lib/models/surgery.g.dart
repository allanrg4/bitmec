// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surgery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Surgery _$SurgeryFromJson(Map<String, dynamic> json) {
  return Surgery(
    id: json['id'] as int,
    operation: json['operation'] as String,
    historicalCondition: json['historical_condition'] as int,
    operationDate: json['operation_date'] as String,
    operatingDoctor: json['operating_doctor'] as String,
    images: (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SurgeryToJson(Surgery instance) => <String, dynamic>{
      'id': instance.id,
      'operation': instance.operation,
      'historical_condition': instance.historicalCondition,
      'operation_date': instance.operationDate,
      'operating_doctor': instance.operatingDoctor,
      'images': instance.images,
    };
