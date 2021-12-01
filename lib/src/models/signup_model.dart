class SignUpResponseModel {
  final String message;

  SignUpResponseModel({required this.message});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> res) {
    return SignUpResponseModel(message: res['message']);
  }
}

class SignupRequestModel {
  String SignUpAs;
  String Name;
  String Branch;
  String Sid;
  String PhoneNumber;
  String email;
  String password; // as in api eveything is in string form

  SignupRequestModel(
      {this.email = '', // has to give default values
      this.password = '',
      this.SignUpAs = '',
      this.Name = '',
      this.Branch = '',
      this.Sid = '',
      this.PhoneNumber = ''});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Email': email.trim(),
      'Password': password.trim(),
      'SignUpAs': SignUpAs.trim(),
      'Name': Name.trim(),
      'Branch': Branch.trim(),
      'Sid': Sid.trim(),
      'PhoneNumber': PhoneNumber.trim(),
    };
    return map;
  }
}
