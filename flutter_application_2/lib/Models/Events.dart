import 'package:cloud_firestore/cloud_firestore.dart';

class Event
{ String eventTitle;
  String eventDescription;
  String eventPlace;
  String date;
  String imgUrl;
  Timestamp createdAt;

Event({
    required this.eventTitle,
    required this.eventDescription,
    required this.eventPlace,
    required this.date,
    required this.imgUrl,
    required this.createdAt
  });

Map<String, dynamic> toMap(Event myEvent) {
    return {
      'EventTitle': eventTitle,
      'EventDescription': eventDescription,
      'EventPlace': eventPlace,
      'Date': date,
      'ImgUrl': imgUrl,
      'CreatedAt':createdAt,

    };
  }
}