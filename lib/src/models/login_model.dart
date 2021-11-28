class LoginResponseModel {
  final String message;

  LoginResponseModel({required this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> res) {
    return LoginResponseModel(message: res['message']);
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email = '', // has to give default values
    this.password = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Email': email.trim(),
      'Password': password.trim(),
    };
    return map;
  }
}
