
import 'package:wp_commerce_1/modules/domain/model/user.dart';

abstract class AuthService {
  Future<User?> login(String username, String password);
  Future<User> signup(String email, String password);
}