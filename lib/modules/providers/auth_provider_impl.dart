import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:wp_commerce_1/interfaces/BaseHttp.dart';
import 'package:wp_commerce_1/modules/domain/model/user.dart';
import 'package:wp_commerce_1/modules/domain/providers/auth_provider.dart';
import 'package:wp_commerce_1/modules/providers/dto/login_dto.dart';
import 'package:wp_commerce_1/modules/providers/dto/signup_dto.dart';

class AuthProviderImpl extends AuthProvider {
  final String _baseUri = '/simple-jwt-login/v1';

  BaseHttp baseHttp = Get.put(BaseHttp());

  @override
  Future<Response<String>> login(String username, String password) async {
    LoginDto loginDto = LoginDto(username, password);
    var request = await baseHttp.post("$_baseUri/auth", loginDto.toJson());
    var data = request.body["data"];
    String body;

    if (request.isOk) {
      body = data!["jwt"];
    } else {
      body = data!["message"];
    }

    return Response(
      statusCode: request.statusCode,
      statusText: request.statusText,
      body: body,
    );
  }

  @override
  Future<Response> signup(String email, String password) {
    final signupDto = SignupDto(email, password);
    return baseHttp.post("$_baseUri/users", signupDto.toJson());
  }

  @override
  User? decodeJWT(String? token) {
    if(token == null) return null;
    return _decodeJWT(JwtDecoder.decode(token));
  }

  User _decodeJWT(Map<String, dynamic> json) =>
      User(displayName: json['username'], email: json['email'], id: json['id']);
}
