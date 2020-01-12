// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    birthDate: json['birth_date'] as String,
    gender: json['gender'] as bool,
    governmentId: json['government_id'] as String,
    profilePicture: json['profile_picture'] as String,
    phoneNumber: json['phone_number'] as String,
    country: json['country'] as String,
    state: json['state'] as String,
    city: json['city'] as String,
    address: json['address'] as String,
    alive: json['alive'] as bool,
    active: json['active'] as bool,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    consultations: (json['consultations'] as List)
        ?.map((e) =>
            e == null ? null : Consultation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'government_id': instance.governmentId,
      'profile_picture': instance.profilePicture,
      'phone_number': instance.phoneNumber,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'alive': instance.alive,
      'active': instance.active,
      'entity': instance.entity?.toJson(),
      'consultations':
          instance.consultations?.map((e) => e?.toJson())?.toList(),
    };