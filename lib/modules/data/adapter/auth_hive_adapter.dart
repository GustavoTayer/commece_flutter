import 'package:hive/hive.dart';
import 'package:wp_commerce_1/modules/domain/repositories/auth_persistence.dart';

class AuthHiveAdapter extends AuthPersistence {
  @override
  Future<String> retrieveToken() async {
    var tokenBox = await _getBox();
    return tokenBox.get('value');
  }

  @override
  Future<void> storeToken(String token) async {
    var tokenBox = await _getBox();
    tokenBox.put('value', token);
  }

  Future<Box> _getBox() {
    return Hive.openBox('token');
  }

}