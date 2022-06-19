import 'package:json_annotation/json_annotation.dart';

part 'product_price_dto.g.dart';

@JsonSerializable()
class ProductPriceDto {
  String price;

  @JsonKey(name: "regular_price")
  String regularPrice;

  @JsonKey(name: 'sale_price')
  String salePrice;

  @JsonKey(name: 'price_range')
  String? priceRange;

  @JsonKey(name: 'currency_code')
  String currencyCode;

  @JsonKey(name: 'currency_symbol')
  String currencySymbol;

  @JsonKey(name: 'currency_minor_unit')
  int minorUnit;

  @JsonKey(name: 'currency_decimal_separator')
  String decimalSeparator;

  @JsonKey(name: 'currency_thousand_separator')
  String thousandSeparator;

  @JsonKey(name: 'currency_prefix')
  String? prefix;

  @JsonKey(name: 'currency_suffix')
  String? suffix;

  ProductPriceDto(
      this.price,
      this.regularPrice,
      this.salePrice,
      this.priceRange,
      this.currencyCode,
      this.currencySymbol,
      this.minorUnit,
      this.decimalSeparator,
      this.thousandSeparator,
      this.prefix,
      this.suffix);

  factory ProductPriceDto.fromJson(Map<String, dynamic> json) => _$ProductPriceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductPriceDtoToJson(this);
}
