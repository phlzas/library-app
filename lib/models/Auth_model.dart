class User {
  User({
    required this.message ,
    required this.status ,
  });
  String message;
  bool status ;
}

class AuthModel {
  AuthModel({required this.user});
  User user;
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      user: User(
      message: json["message"],
       status:  json["statusCode"]
      ),
    );
  }
}
