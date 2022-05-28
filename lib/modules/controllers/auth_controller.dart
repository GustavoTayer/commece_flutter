import 'package:get/get.dart';
import 'package:wp_commerce_1/modules/domain/service/auth_service.dart';
import 'package:wp_commerce_1/modules/domain/service/impl/auth_service_impl.dart';

import '../domain/model/user.dart';

class AuthController extends GetxController {
  var loading = false.obs;
  var token = "".obs;
  var user;

  final AuthService authService = Get.put(AuthServiceImpl());

  Future<void> signIn(
      {required String email,
      required String password,
      required Function onFail,
      required Function onSuccess}) async {
    loading = true.obs;

    try {
      User result = await authService.login(email, password);
      onSuccess();

      onSuccess('sucesso');
    } catch (e) {
      print(e);
      onFail('login-failed'.tr);
    }
    loading = false.obs;
  }
}
