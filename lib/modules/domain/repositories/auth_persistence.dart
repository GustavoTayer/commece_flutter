abstract class AuthPersistence {
  Future<void> storeToken(String token);
  Future<String> retrieveToken();
}