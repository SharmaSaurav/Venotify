import 'package:flutter/material.dart';
import 'package:venotify/src/login_signup/signup.dart';

List<MultiSelectDialogItem<int>> clubs = [];

final clubsinlist = {
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
  13: 'ACM CSS',
  14: 'Aerospace Technical Society (ATC)',
  15: 'American Society of Civil Engineers (ASCE)',
  16: 'Indian Institute of Metals (IIM)',
  17: 'Astronomy and Space Physics Society (ASPS)',
  18: 'Institute of Electronics and Electrical Engineers (IEEE)',
  19: 'Society of Automotive Engineers (SAE)',
  20: 'Institution of Electronics and Telecommunication Engineers (IETE)',
  21: 'Society Of Manufacturing Engineers (SME)',
  22: 'Solar Energy Society of India (SESI)',
  23: 'Robotics Society',
  24: 'American Society of Mechanical Engineers (ASME)',
  25: 'NSS',
  26: 'NCC',
};

void populateclubs() {
  for (int i in clubsinlist.keys) {
    clubs.add(MultiSelectDialogItem(i, clubsinlist[i]!));
  }
}
