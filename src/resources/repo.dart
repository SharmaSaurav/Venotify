import 'dart:async';
import 'announcements_api_provider.dart';
import 'announcements_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewsApiProvider newsApi = NewsApiProvider();
  NewsDbProvider newsDb = NewsDbProvider();

  // Future<List<int>> fetchTopId() {
  //   return newsApi.fetchAnnouncments();
  // }

  // currently we want to fetch data from api only
  Future<AnnouncementModel?> fetchAnnouncments() async {
    var announcment = await newsApi.fetchAnnouncmentsApi();
    return announcment;
  }
}

  // Future<AnnouncementModel?> fetchAnnouncments(int id) async {
  //   var announcment = await newsDb.fetchAnnouncmentDb(id);
  //   if (announcment != null) {
  //     return announcment;
  //   } else {
  //     announcment = await newsApi.fetchAnnouncmentsApi();
  //     newsDb.addItem(
  //         announcment); // its async but we wont put await here cuz this thing can happen anytime in future as we dont need it asap
  //     return announcment;
  //   }
  // }

