import 'dart:convert';

class AnnouncementResponseModel {
  final String message;

  AnnouncementResponseModel({required this.message});

  factory AnnouncementResponseModel.fromJson(Map<String, dynamic> res) {
    return AnnouncementResponseModel(message: res['message']);
  }
}

class AnnouncementModel {
  // final String _id;
  String Organiser;
  String Time;
  // final String Title;
  String Date_;
  String Place;
  // final List<dynamic> kids;
  String Description;
  // for homepage(to recieve announcment)

  AnnouncementModel(
      {this.Date_ = '',
      this.Description = '',
      this.Organiser = '',
      this.Place = '',
      this.Time = ''});
  AnnouncementModel.fromJson(Map<String, dynamic> parsedJson)
      :
        // _id = parsedJson['_id']
        Organiser = parsedJson['Organiser'],
        Time = parsedJson['Time'],
        // Title = parsedJson['Title'],
        Date_ = parsedJson['Date_'],
        Place = parsedJson['Place'],
        Description = parsedJson['Description'];
  // for announcment page(to send announcment)
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      // 'Title':title,
      'Organiser': Organiser.trim(),
      'Time': Time.trim(),
      'Date_': Date_.trim(),
      'Place': Place.trim(),
      'Description': Description.trim()
      // 'kids': jsonEncode(kids),
    };
  }

  // not focusing on Database part for now
  AnnouncementModel.fromdb(Map<String, dynamic> parsedJson)
      :
        // _id = parsedJson['_id'],
        Organiser = parsedJson['Organiser'],
        Time = parsedJson['Time'],
        Date_ = parsedJson['Date_'],
        Place = parsedJson['Place'],
        Description = parsedJson['Description'];
  // kids = jsonDecode(parsedJson[
  //     'kids']), // blob from sql is returned a string on integer which are to be converted to integer by jsonDecode

  Map<String, dynamic> revertToMapForDb() {
    return <String, dynamic>{
      // '_id': _id,
      'Organiser': Organiser,
      'Time': Time,
      'Date_': Date_,
      'Place': Place,
      'Description': Description
      // 'kids': jsonEncode(kids),
    };
  }
}
