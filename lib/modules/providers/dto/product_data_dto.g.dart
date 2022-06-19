// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDataDto _$ProductDataDtoFromJson(Map<String, dynamic> json) =>
    ProductDataDto(
      json['id'] as int,
      json['name'] as String,
      (json['images'] as List<dynamic>)
          .map((e) => ImgDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      ProductPriceDto.fromJson(json['prices'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataDtoToJson(ProductDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'prices': instance.prices,
    };
