import 'package:get/get.dart';

class SearchController extends GetxController {
  var query = "".obs;

  void changeQuery(String q) {
    query = q.obs;
    update();
  }

}