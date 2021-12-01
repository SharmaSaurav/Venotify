import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import '../models/announcement_model.dart';
import 'dart:async';
import '../models/login_model.dart';
import '../models/signup_model.dart';

final _root = 'https://fierce-bayou-06187.herokuapp.com';

class NewsApiProvider {
  Client client = Client();
  Future<AnnouncementModel> fetchAnnouncmentsApi() async {
    final res = await client
        .get(Uri.parse('$_root/HomePage')); // brings a list of announcements
    final parsedJson = json.decode(res.body);

    return AnnouncementModel.fromJson(parsedJson[0]);
  }

  Future<LoginResponseModel> checkLoginApi(LoginRequestModel LogReq) async {
    final res = await http.post('$_root/Login', body: LogReq.toJson());
    if (res.statusCode == 200 || res.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(res.body));
    } else {
      throw "failed to throw Login data";
    } // sends Login details
  }

  Future<SignUpResponseModel> SignUpApi(SignupRequestModel SignReq) async {
    final res = await http.post('$_root/SignUp', body: SignReq.toJson());
    if (res.statusCode == 200 ||
        res.statusCode == 400 ||
        res.statusCode == 403) {
      return SignUpResponseModel.fromJson(json.decode(res.body));
    } else {
      throw "failed to throw Signup data";
    } // sends Login details
  }

  Future<AnnouncementResponseModel> AnnouncementApi(
      AnnouncementModel AnnouncementReq) async {
    final res =
        await http.post('$_root/Announcement', body: AnnouncementReq.toJson());
    if (res.statusCode == 200 || res.statusCode == 400) {
      return AnnouncementResponseModel.fromJson(json.decode(res.body));
    } else {
      throw "failed to throw Announcement data";
    } // sends Login details
  }
}
