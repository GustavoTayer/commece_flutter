// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceDto _$ProductPriceDtoFromJson(Map<String, dynamic> json) =>
    ProductPriceDto(
      json['price'] as String,
      json['regular_price'] as String,
      json['sale_price'] as String,
      json['price_range'] as String?,
      json['currency_code'] as String,
      json['currency_symbol'] as String,
      json['currency_minor_unit'] as int,
      json['currency_decimal_separator'] as String,
      json['currency_thousand_separator'] as String,
      json['currency_prefix'] as String?,
      json['currency_suffix'] as String?,
    );

Map<String, dynamic> _$ProductPriceDtoToJson(ProductPriceDto instance) =>
    <String, dynamic>{
      'price': instance.price,
      'regular_price': instance.regularPrice,
      'sale_price': instance.salePrice,
      'price_range': instance.priceRange,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
      'currency_minor_unit': instance.minorUnit,
      'currency_decimal_separator': instance.decimalSeparator,
      'currency_thousand_separator': instance.thousandSeparator,
      'currency_prefix': instance.prefix,
      'currency_suffix': instance.suffix,
    };
