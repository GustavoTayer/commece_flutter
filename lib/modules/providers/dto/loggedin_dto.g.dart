// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loggedin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInDto _$LoggedInDtoFromJson(Map<String, dynamic> json) => LoggedInDto(
      TokenData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoggedInDtoToJson(LoggedInDto instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };
