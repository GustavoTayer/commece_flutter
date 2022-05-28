import 'package:json_annotation/json_annotation.dart';
part 'signup_dto.g.dart';

@JsonSerializable()
class SignupDto {
  String email;
  String password;

  SignupDto(this.email, this.password);

  factory SignupDto.fromJson(Map<String, dynamic> json) => _$SignupDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignupDtoToJson(this);
}