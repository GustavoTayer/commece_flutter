class User {
  int id;
  String email;
  String displayName;
  List<String>? roles;

  User({required this.id,required this.email,required this.displayName, this.roles});
}