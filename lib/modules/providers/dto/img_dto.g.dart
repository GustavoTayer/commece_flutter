// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'img_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImgDto _$ImgDtoFromJson(Map<String, dynamic> json) => ImgDto(
      json['id'] as int,
      json['src'] as String,
      json['thumbnail'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$ImgDtoToJson(ImgDto instance) => <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
    };
