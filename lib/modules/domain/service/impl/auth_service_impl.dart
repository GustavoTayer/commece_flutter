import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/data/adapter/auth_hive_adapter.dart';
import 'package:wp_commerce_1/modules/domain/exceptions/bad_request_exception.dart';
import 'package:wp_commerce_1/modules/domain/model/user.dart';
import 'package:wp_commerce_1/modules/domain/providers/auth_provider.dart';
import 'package:wp_commerce_1/modules/domain/repositories/auth_persistence.dart';
import 'package:wp_commerce_1/modules/domain/service/auth_service.dart';
import 'package:wp_commerce_1/modules/providers/auth_provider_impl.dart';

class AuthServiceImpl extends AuthService {
  final AuthPersistence authPersistence = Get.put(AuthHiveAdapter());
  final AuthProvider authProvider = Get.put(AuthProviderImpl());

  @override
  Future<User?> login(String username, String password) async {
    Response<String> tokenResponse =
        await authProvider.login(username, password);
    if (tokenResponse.hasError) {
      throw BadRequestException("Senha/Usuário inválido");
    }

    var token = tokenResponse.body!;
    authPersistence.storeToken(token);
    return authProvider.decodeJWT(token);
  }

  @override
  Future<User> signup(String email, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
