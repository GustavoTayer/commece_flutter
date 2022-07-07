
import 'package:json_annotation/json_annotation.dart';

part 'product_filter_provider.g.dart';

@JsonSerializable()
class ProductFilterProvider {

  String? search;

  @JsonKey(name: "max_price")
  int? maxPrice;

  @JsonKey(name: "min_price")
  int? minPrice;

  ProductFilterProvider({this.search, this.maxPrice, this.minPrice});

  factory ProductFilterProvider.fromJson(Map<String, dynamic> json) => _$ProductFilterProviderFromJson(json);
  Map<String, dynamic> toJson() => _$ProductFilterProviderToJson(this);
}