import 'package:json_annotation/json_annotation.dart';
import 'package:wp_commerce_1/modules/providers/dto/token_data_dto.dart';

part 'loggedin_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class LoggedInDto {
  TokenData data;

  LoggedInDto(this.data);


  factory LoggedInDto.fromJson(Map<String, dynamic> json) => _$LoggedInDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedInDtoToJson(this);
}
