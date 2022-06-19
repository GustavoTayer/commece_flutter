
import 'package:json_annotation/json_annotation.dart';
part 'img_dto.g.dart';


@JsonSerializable()
class ImgDto {
  int id;
  String src;
  String thumbnail;
  String name;

  ImgDto(this.id, this.src, this.thumbnail, this.name);

  factory ImgDto.fromJson(Map<String, dynamic> json) => _$ImgDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ImgDtoToJson(this);
}