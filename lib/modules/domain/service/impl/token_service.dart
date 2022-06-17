import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/data/adapter/auth_hive_adapter.dart';
import 'package:wp_commerce_1/modules/domain/repositories/auth_persistence.dart';

class TokenService {
final AuthPersistence authPersistence = Get.put(AuthHiveAdapter());

  Future<String?> getToken() async {
    var token = await authPersistence.retrieveToken();
    return token;
  }
}