// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenData _$TokenDataFromJson(Map<String, dynamic> json) => TokenData(
      json['token'] as String,
      json['id'] as int,
      json['email'] as String,
      json['nicename'] as String?,
      json['displayName'] as String,
    );

Map<String, dynamic> _$TokenDataToJson(TokenData instance) => <String, dynamic>{
      'token': instance.token,
      'id': instance.id,
      'email': instance.email,
      'nicename': instance.nicename,
      'displayName': instance.displayName,
    };
