import 'package:flutter/material.dart';

class Member {
  String userID;
  String fullName;
  String dateOfBirth;
  String userEmail;

  String userPhoneNumber;
  String gender;
  String nationality;
  String martialStatus;

  String regionBirth;
  String cityBirth;
  String woredaBirth;
  String kebeleBirth;

  String houseNumberBirth;
  String subCityBirth;
  String regionResidence;
  String cityResidence;

  String woredaResidence;
  String kebeleResidence;
  String houseNumberResidence;
  String subCityResidence;

  String postalCodeResidence;
  String nameofInstitution;
  String jobProffession;
  String workRegion;

  String workCity;
  String workPObox;
  String workSubCity;
  String workWoreda;

  String workKebele;
  String workHouseNumber;
  String userImageURL;
  String artistCategory;

  String cvURL;
  String youtubeLink;

  Member({
    required this.userID,
    required this.fullName,
    required this.dateOfBirth,
    required this.userEmail,
    required this.userPhoneNumber,
   // required this.homePhoneNumber,
    required this.gender,
    required this.nationality,
    required this.martialStatus,
    required this.regionBirth,
    required this.cityBirth,
    required this.woredaBirth,
    required this.kebeleBirth,
    required this.houseNumberBirth,
    required this.subCityBirth,
    required this.regionResidence,
    required this.cityResidence,
    required this.woredaResidence,
    required this.kebeleResidence,
    required this.houseNumberResidence,
    required this.subCityResidence,
    required this.postalCodeResidence,
    required this.nameofInstitution,
    required this.jobProffession,
    required this.workRegion,
    required this.workCity,
    required this.workPObox,
    required this.workSubCity,
    required this.workWoreda,
    required this.workKebele,
    required this.workHouseNumber,
   // required this.dateofApplication,
    required this.userImageURL,
    required this.artistCategory,
    required this.cvURL,
    required this.youtubeLink,
  });

  Map<String, dynamic> toMap(Member member) {
    return {
      'userID': userID,
      'fullName': fullName,
      'dateOfBirth': dateOfBirth,
      'userEmail': userEmail,
      'userPhoneNumber': userPhoneNumber,
     // 'homePhoneNumber': homePhoneNumber,
      'gender': gender,
      'nationality': nationality,
      'martialStatus': martialStatus,
      'regionBirth': regionBirth,
      'cityBirth': cityBirth,
      'woredaBirth': woredaBirth,
      'kebeleBirth': kebeleBirth,
      'houseNumberBirth': houseNumberBirth,
      'subCityBirth': subCityBirth,
      'regionResidence': regionResidence,
      'cityResidence': cityResidence,
      'woredaResidence': woredaResidence,
      'kebeleResidence': kebeleResidence,
      'houseNumberResidence': houseNumberResidence,
      'subCityResidence': subCityResidence,
      'postalCodeResidence': postalCodeResidence,
      'nameofInstitution': nameofInstitution,
      'jobProffession': jobProffession,
      'workRegion': workRegion,
      'workCity': workCity,
      'workPObox': workPObox,
      'workSubCity': workSubCity,
      'workWoreda': workWoreda,
      'workKebele': workKebele,
      'workHouseNumber': workHouseNumber,
     // 'dateofApplication': dateofApplication?.toString(),
      'userImageURL': userImageURL,
      'artistCategory': artistCategory,
      'cvURL': cvURL,
      'youtubeLink': youtubeLink,
    };
  }
}