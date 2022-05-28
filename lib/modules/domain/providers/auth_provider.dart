import 'package:get/get.dart';

import '../model/user.dart';

mixin AuthProvider {
  Future<Response<String>> login(String username, String password);
  Future<Response> signup(String email, String password);
  User decodeJWT(String token);

}