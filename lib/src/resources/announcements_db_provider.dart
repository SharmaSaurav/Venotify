// ignore_for_file: file_names, camel_case_types

import 'package:sqflite/sqflite.dart'; // it works only on mobile(sqf)
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';

class NewsDbProvider {
  late Database db;

  void init() async {
    Directory documentsDirectory =
        await getApplicationDocumentsDirectory(); // creates a directory somewhere in the file
    final path = join(documentsDirectory.path,
        "announcements.db"); // this is the path to the database
    db = await openDatabase(
        path, // if path exists(app is just restarted) it uses the prev path else if app is installed for first time it creates a new path
        version:
            1, // its defied by us if we make a big change we change the version
        onCreate: (Database newDb, version) {
      // only called on the first time
      newDb.execute("""
          CREATE TABLE Items(
            _id INTEGER PRIMARY KEY,
            Organiser TEXT,
            Time INTEGER,
            Date_ INTEGER,
            Place TEXT,
            Description  TEXT,
          )
        """); // CREATES sql code
    });
  }

  Future<AnnouncementModel?> fetchAnnouncmentDb(int id) async {
    // that question mark means its nullable
    final maps = await db.query(
      // as at the end we will return a list of maps, maps of strings(id,type) as string and dynamic as value,
      // but as  one fetchItem in news_api_provider returns item model we'll return that here as well

      "Items",
      columns: null, // if you want a specific column ['id','title]
      where: "id=?",
      whereArgs: [id], // the ? is replaced by first element of whereArgs list
      // it is done to save database from malware
    );

    if (maps.length > 0) {
      return AnnouncementModel.fromdb(maps.first); // as maps was a list of maps
    }

    return null;
  }

  Future<int> addItem(AnnouncementModel item) {
    return db.insert("items", item.revertToMapForDb());
  }
}
