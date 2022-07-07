// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilterProvider _$ProductFilterProviderFromJson(
        Map<String, dynamic> json) =>
    ProductFilterProvider(
      search: json['search'] as String?,
      maxPrice: json['max_price'] as int?,
      minPrice: json['min_price'] as int?,
    );

Map<String, dynamic> _$ProductFilterProviderToJson(
        ProductFilterProvider instance) =>
    <String, dynamic>{
      'search': instance.search,
      'max_price': instance.maxPrice,
      'min_price': instance.minPrice,
    };
