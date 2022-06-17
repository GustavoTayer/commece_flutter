import 'package:json_annotation/json_annotation.dart';

part 'product_data_dto.g.dart';

@JsonSerializable()
class ProductDataDto {
  int id;
  String name;

  ProductDataDto(this.id, this.name);

  factory ProductDataDto.fromJson(Map<String, dynamic> json) => _$ProductDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDataDtoToJson(this);
}