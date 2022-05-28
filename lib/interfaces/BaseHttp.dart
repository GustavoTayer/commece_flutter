import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:wp_commerce_1/modules/domain/service/auth_service.dart';
import 'package:wp_commerce_1/modules/domain/service/impl/auth_service_impl.dart';

class BaseHttp extends GetConnect {
  AuthService authService = Get.put(AuthServiceImpl());

  @override
  void onInit() {
    // add your local storage here to load for every request
    // var token = LocalStorage.readToken();
    //1.base_url
    httpClient.baseUrl = "https://testevisualcode.com.br/wp-json";
    //2.
    httpClient.defaultContentType = "application/json";
    // httpClient.timeout = Duration(seconds: 8);
    // httpClient.addResponseModifier((request, response) async {
    //   print(response.body);
    // });
    // httpClient.addRequestModifier((request) async {
    //   // add request here
    //   return request;
    // });
    httpClient.addAuthenticator((Request request) async {
      var token = await authService.getToken();
      if(token != null) {
        request.headers['Authorization'] = "Bearer $token";
      } else if(request.headers.containsKey('Authorization')) {
        request.headers.remove('Authorization');
      }

      return request;
    });

    httpClient.maxAuthRetries = 1;

    super.onInit();
  }
}