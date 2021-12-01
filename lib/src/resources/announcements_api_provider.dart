import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' show Client;
import '../models/announcement_model.dart';
import 'dart:async';

final _root = 'https://fierce-bayou-06187.herokuapp.com';

class NewsApiProvider {
  Client client = Client();
  Future<AnnouncementModel> fetchAnnouncmentsApi() async {
    final res = await client
        .get(Uri.parse('$_root/HomePage')); // brings a list of announcements
    // print(res);
    final a = res.body; // takes out 1st announcement dont know if it works
    final parsedJson = json.decode(a);

    return AnnouncementModel.fromJson(parsedJson[0]);
  }
}
