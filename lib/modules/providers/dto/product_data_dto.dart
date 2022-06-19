import 'package:json_annotation/json_annotation.dart';
import 'package:wp_commerce_1/modules/providers/dto/product_price_dto.dart';

import 'img_dto.dart';

part 'product_data_dto.g.dart';

@JsonSerializable()
class ProductDataDto {
  int id;
  String name;
  List<ImgDto> images;
  ProductPriceDto prices;

  ProductDataDto(this.id, this.name, this.images, this.prices);

  factory ProductDataDto.fromJson(Map<String, dynamic> json) => _$ProductDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataDtoToJson(this);
}