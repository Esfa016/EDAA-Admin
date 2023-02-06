import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Member%20Management/TraditionalDancers.dart';
import 'package:flutter_application_2/Models/Events.dart';
import 'package:flutter_application_2/Models/HonoraryModel.dart';
import 'package:flutter_application_2/Models/License.dart';
import 'package:flutter_application_2/Models/Member.dart';
import 'package:flutter_application_2/Models/News.dart';

class DbContext with ChangeNotifier {
  DbContext() {
    populateTraditionalDancers();
  }

  //
  List<License> licenseList = [];
  List<Member> traditionalDancers = [];
  List<Member> traditionaChoreographers = [];

  Future<void> populate() async {
    var licenseHolder =
        FirebaseFirestore.instance.collection('Licenses').snapshots();
    licenseHolder.forEach((element) {
      element.docs.forEach((element) {
        var data = element.data();
        licenseList.add(License(
            fullName: data['FullName'],
            occupation: 'Occupation',
            licenseId: 'LicenseId',
            email: data['Email'],
            phone: data['Phone'],
            issueDate: data['IssueDate'],
            expiryDate: data['ExpiryDate'],
            imgUrl: data['imgUrl'],
            uid: data['uid'],
            subCity: data['SubCity'],
            address: data['Address'],
            woreda: data['Woreda'],
            houseNumber: data['HouseNumber'],
            status: data['Status']));
      });
    });
    notifyListeners();
    licenseList.forEach((element) {
      print(element.email);
    });
  }

  final mAuth = FirebaseAuth.instance;
  final CollectionReference myInsertion =
      FirebaseFirestore.instance.collection('Admins');
  final CollectionReference honoraryMemberRef =
      FirebaseFirestore.instance.collection('Honorary Members');

  Future<void> signup(String email, password) async {
    await mAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
    } else {
      await mAuth.signInWithEmailAndPassword(email: email, password: password);

      notifyListeners();
    }
  }

  Future<void> registerHonoraryMemeber(HonoraryMemberModel myMember) {
    return FirebaseFirestore.instance
        .collection('Honorary Memebers')
        .doc()
        .set(myMember.toMap(myMember));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchHonoraryMembers(
      String fullName) {
    notifyListeners();
    if (fullName.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Honorary Memebers')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Honorary Memebers')
          .where('fullName', isEqualTo: fullName)
          .snapshots();
    }
  }

  Future<void> adminLogout() async {
    await FirebaseAuth.instance.signOut();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProfile(String uid) {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Admins')
        .where('Authid', isEqualTo: uid)
        .snapshots();
  }

  Future<void> registerMember(Member member) async {
    FirebaseFirestore.instance
        .collection(member.artistCategory + 'Members')
        .doc(member.userID)
        .set(member.toMap(member));

    var querySnapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc(member.userID)
        .get();
    querySnapshots.reference.update({'Status': 'Accepted'}).then((value) => {
          FirebaseFirestore.instance
              .collection(member.artistCategory)
              .doc(member.userID)
              .delete()
        });
  }
  Stream<QuerySnapshot<Map<String, dynamic>>>
      countTraditionalDancerApplicants() {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Traditional Dancer')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> countModernDancerApplicants() {
    notifyListeners();
    return FirebaseFirestore.instance.collection('Modern Dancer').snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      countTraditionalChoreographerApplicants() {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Traditional Choreographer')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      countModernChoreographerApplicants() {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Modern Choreographer')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchApplicants() {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Traditional Choreographer')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchApplicantsByName(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Modern Choreographer')
          .snapshots();
    } else {
      print('Elseee');
      return FirebaseFirestore.instance
          .collection('Modern Choreographer')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTraditonalDancerApplinants(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Traditional Dancer')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Traditional Dancer')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchModernDancerApplicants(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance.collection('Modern Dancer').snapshots();
    }
    return FirebaseFirestore.instance
        .collection('Modern Dancer')
        .where('fullName', isEqualTo: name)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      fetchTraditionalChoreographerApplicants(String name) {
    notifyListeners();

    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Traditional Choreographer')
          .snapshots();
    }
    return FirebaseFirestore.instance
        .collection('Traditional Choreographer')
        .where('fullName', isEqualTo: name)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
      fetchModernChoreographerApplicants(String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Modern Choreographer')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Modern Choreographer')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchModernDancers(String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Modern DancerMembers')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Modern DancerMembers')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTraditionalChoreographer(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Traditional ChoreographerMembers')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Traditional ChoreographerMembers')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchTraditionalDancers(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Traditional DancerMembers')
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Traditional DancerMembers')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchLicense(String email) {
    notifyListeners();

    if (email.isEmpty) {
      return FirebaseFirestore.instance.collection('Licenses').snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Licenses')
          .where('Email', isEqualTo: email)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchNews(String newsTitle) {
    notifyListeners();
    if (newsTitle.isEmpty) {
      return FirebaseFirestore.instance
          .collection('News')
          .orderBy('CreatedAt', descending: true)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('News')
          .where('NewsTitle', isEqualTo: newsTitle)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchEvents(String eventTitle) {
    notifyListeners();
    if (eventTitle.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Events')
          .orderBy('CreatedAt', descending: true)
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('Events')
          .where('EventTitle', isEqualTo: eventTitle)
          .snapshots();
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchModernChoreographersByName(
      String name) {
    notifyListeners();
    if (name.isEmpty) {
      return FirebaseFirestore.instance
          .collection('Modern ChoreographerMembers')
          .snapshots();
    } else {
      print('Elseee');
      return FirebaseFirestore.instance
          .collection('Modern ChoreographerMembers')
          .where('fullName', isEqualTo: name)
          .snapshots();
    }
  }

  Future<bool> checkLicense(String mAuth) async {
    bool exist = false;
    await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(mAuth)
        .get()
        .then((value) => {
              if (value.exists) {exist = true} else {exist = false}
            });
    return exist;
  }

  Future<bool> checkLicenseId(String licenseId) async {
    bool exists = false;

    var snap = await FirebaseFirestore.instance
        .collection('Licenses')
        .where('LicenseId', isEqualTo: licenseId)
        .get();

    if (snap.docs.length == 0) {
      exists = false;
    } else {
      exists = true;
    }
    return await exists;
  }

  Future<void> generateLicense(License myLicnense) async {
    FirebaseFirestore.instance
        .collection('Licenses')
        .doc(myLicnense.uid)
        .set(myLicnense.toMap(myLicnense))
        .then((value) => {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(myLicnense.uid)
                  .update({'Status': 'Accepted'})
            });
  }

  Future<void> addNews(News news) async {
    return FirebaseFirestore.instance
        .collection('News')
        .doc()
        .set(news.toMap(news));
  }

  Future<void> addEvents(Event myEvent) async {
    return FirebaseFirestore.instance
        .collection('Events')
        .doc()
        .set(myEvent.toMap(myEvent));
  }

  Future<void> updateEvents(Event myEvent, String refTitle) async {
    notifyListeners();
    return FirebaseFirestore.instance
        .collection('Events')
        .where('EventTitle', isEqualTo: refTitle)
        .get()
        .then((value) => value.docs.forEach((element) {
              element.reference.update(myEvent.toMap(myEvent));
            }));
  }

  Future<void> updateNews(News myNews, String refTitle) async {
    notifyListeners();
    return await FirebaseFirestore.instance
        .collection('News')
        .where('NewsTitle', isEqualTo: refTitle)
        .get()
        .then((value) => value.docs.forEach((element) {
              element.reference
                  .update(myNews.toMap(myNews))
                  .then((value) => {
                        print('Success'),
                      })
                  .catchError((onError) {
                print('$onError');
              });
            }));
  }

  Future<void> updateLicense(String mAuth) async {
    notifyListeners();

    var querySnapshots = await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(mAuth)
        .get();
    //filterYear = querySnapshots['ExpiryDate'];

    querySnapshots.reference.update({
      'ExpiryDate': DateTime(
              DateTime.now().year + 2, DateTime.now().month, DateTime.now().day)
          .toString()
    });
  }

  Future<void> disableLicnese(String mAuth) async {
    notifyListeners();
    var querySnapshots = await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(mAuth)
        .get();
    querySnapshots.reference.update({'Status': 'Disabled'});
  }

  Future<void> enableLicnese(String mAuth) async {
    notifyListeners();
    var querySnapshots = await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(mAuth)
        .get();
    querySnapshots.reference.update({'Status': 'Enabled'});
  }

  Future<void> removeNews(News myNews) async {
    notifyListeners();

    FirebaseFirestore.instance
        .collection('News')
        .where('NewsTitle', isEqualTo: myNews.newsTitle)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                element.reference.delete();
              })
            });
  }

  Future<void> enableDisableLicense(String mAuth) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(mAuth)
        .get();
    if (querySnapshot['Status'] == 'Enabled') {
      querySnapshot.reference.update({'Status': 'Disabled'});
    } else {
      querySnapshot.reference.update({'Status': 'Enabled'});
    }

    notifyListeners();
  }

  Future<void> declineApplicant(String uid) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => {
              value.reference.update({'Status': 'Declined'})
            });
  }

  Future<void> delApplicants(String uid, String coll) {
    return FirebaseFirestore.instance.collection(coll).doc(uid).delete();
  }

  Future<void> removeEvents(Event myEvent) {
    return FirebaseFirestore.instance
        .collection('Events')
        .where('EventTitle', isEqualTo: myEvent.eventTitle)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                element.reference.delete();
              })
            });
  }

  Future<void> removeLicense(String uid) async {
    return await FirebaseFirestore.instance
        .collection('Licenses')
        .doc(uid)
        .delete()
        .then((value) => {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .get()
                  .then((value) => {
                        value.reference.update({'Status': 'Banned'})
                      })
            });
  }

  Future<void> removeHonoraryMember(String email) async {
    return await FirebaseFirestore.instance
        .collection('Honorary Memebers')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                element.reference.delete();
              })
            });
  }

  Future populateTraditionalDancers() async {
    FirebaseFirestore.instance
        .collection('Traditional ChoreographerMembers')
        .snapshots()
        .forEach((element) {
       traditionalDancers.clear();
      element.docs.forEach((element) {
        var data = element.data();
        traditionalDancers.add(new Member(
            userID: data['userID'],
            fullName: data['fullName'],
            dateOfBirth: data['dateOfBirth'],
            userEmail: data['userEmail'],
            userPhoneNumber: data['userPhoneNumber'],
            gender: data['gender'],
            nationality: data['nationality'],
            martialStatus: data['martialStatus'],
            regionBirth: data['regionBirth'],
            cityBirth: data['cityBirth'],
            woredaBirth: data['woredaBirth'],
            kebeleBirth: data['kebeleBirth'],
            houseNumberBirth: data['houseNumberBirth'],
            subCityBirth: data['subCityBirth'],
            regionResidence: data['regionResidence'],
            cityResidence: data['cityResidence'],
            woredaResidence: data['woredaResidence'],
            kebeleResidence: data['kebeleResidence'],
            houseNumberResidence: data['houseNumberResidence'],
            subCityResidence: data['subCityResidence'],
            postalCodeResidence: data['postalCodeResidence'],
            nameofInstitution: data['nameofInstitution'],
            jobProffession: data['jobProffession'],
            workRegion: data['workRegion'],
            workCity: data['workCity'],
            workPObox: data['workPObox'],
            workSubCity: data['workSubCity'],
            workWoreda: data['workWoreda'],
            workKebele: data['workKebele'],
            workHouseNumber: data['workHouseNumber'],
            userImageURL: data['userImageURL'],
            artistCategory: data['artistCategory'],
            cvURL: data['cvURL'],
            youtubeLink: data['youtubeLink']));
      });
      notifyListeners();
    });
  }
}
