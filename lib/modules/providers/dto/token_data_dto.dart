import 'package:json_annotation/json_annotation.dart';

part 'token_data_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenData {
  String token;
  int id;
  String email;
  String? nicename;
  String displayName;

  TokenData(this.token, this.id, this.email, this.nicename, this.displayName);

  factory TokenData.fromJson(Map<String, dynamic> json) => _$TokenDataFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDataToJson(this);

}