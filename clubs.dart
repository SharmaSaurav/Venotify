import 'package:flutter/material.dart';
import 'package:venotify/src/login_signup/signup.dart';

List<MultiSelectDialogItem<int>> clubs = [];

var clubsinlist = {
  1: 'Art and Photography Club (APC)',
  2: 'Music Club',
  3: 'Dramatics Club',
  4: 'Speakers Association And Study Circle (SAASC)',
  5: 'Projection and Design club (PDC)',
  6: 'Rotaract Club',
  7: 'Communication, Information and Media Cell',
  8: 'English Editorial Board',
  9: 'Punjabi Editorial Board',
  10: 'Hindi Editorial Board',
  11: 'Entrepreneurship and Incubment Cell (EIC)',
  12: 'Student Counselling Cell (SCC)',
  13: 'Aerospace Technical Society (ATC)',
  14: 'American Society of Civil Engineers (ASCE)',
  15: 'Indian Institute of Metals (IIM)',
  16: 'Astronomy and Space Physics Society (ASPS)',
  17: 'Institute of Electronics and Electrical Engineers (IEEE)',
  18: 'Society of Automotive Engineers (SAE)',
  19: 'Institution of Electronics and Telecommunication Engineers (IETE)',
  20: 'Society Of Manufacturing Engineers (SME)',
  21: 'Solar Energy Society of India (SESI)',
  22: 'Robotics Society',
  23: 'American Society of Mechanical Engineers (ASME)',
  24: 'NSS',
  25: 'NCC',
};

void populateclubs() {
  for (int i in clubsinlist.keys) {
    clubs.add(MultiSelectDialogItem(i, clubsinlist[i]!));
  }
}
