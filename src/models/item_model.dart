import 'dart:convert';

class AnnouncementModel {
  final String _id;
  final String Organiser;
  final int Time;
  // final String Title;
  final String Date_;
  final String Place;
  // final List<dynamic> kids;
  final String Description;

  AnnouncementModel.fromJson(Map<String, dynamic> parsedJson)
      : _id = parsedJson['_id'],
        Organiser = parsedJson['Organiser'],
        Time = parsedJson['Time'],
        // Title = parsedJson['Title'],
        Date_ = parsedJson['Date_'],
        Place = parsedJson['Place'],
        Description = parsedJson['Description'];

  // not focusing on Database part for now
  AnnouncementModel.fromdb(Map<String, dynamic> parsedJson)
      : _id = parsedJson['_id'],
        Organiser = parsedJson['Organiser'],
        Time = parsedJson['Time'],
        Date_ = parsedJson['Date_'],
        Place = parsedJson['Place'],
        Description = parsedJson['Description'];
  // kids = jsonDecode(parsedJson[
  //     'kids']), // blob from sql is returned a string on integer which are to be converted to integer by jsonDecode

  Map<String, dynamic> revertToMapForDb() {
    return <String, dynamic>{
      '_id': _id,
      'Organiser': Organiser,
      'Time': Time,
      'Date_': Date_,
      'Place': Place,
      'Description': Description
      // 'kids': jsonEncode(kids),
    };
  }
}
