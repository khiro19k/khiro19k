import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double rating(List<double> rate) {
  // calculate rateing of product
  double sum = rate.reduce((value, element) => value + element);
  double average = sum / rate.length;
  return average;
}

bool? countdown(
  DateTime? logedintime,
  DateTime? time,
) {
  // check if user is on trial the trial take 3 days
  if (logedintime == null || time == null) {
    return null;
  }

  Duration trialDuration = Duration(days: 3);
  DateTime trialEndTime = logedintime.add(trialDuration);

  if (time.isBefore(trialEndTime)) {
    return true;
  } else {
    return false;
  }
}
