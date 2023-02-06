import 'dart:convert';

import 'package:flutter/cupertino.dart';




class HonoraryMemberModel
{
  String fullName;
  String occupation;
  String email;
  String phone;
  String imgUrl;
  String woreda;
  String gender;
  String city;
  String region;
  String kebele;
  String subCity;
  String yearsWorked;
  String houseNumber;

  HonoraryMemberModel({
    required this.fullName,
    required this.occupation,
    required this.email,
    required this.phone,
    required this.imgUrl,
    required this.woreda,
    required this.city,
    required this.gender,
    required this.region,
    required this.kebele,
    required this.subCity,
    required this.yearsWorked,
    required this.houseNumber,
  });

  Map<String, dynamic> toMap( HonoraryMemberModel myMember) {
    return {
      'fullName': fullName,
      'occupation': occupation,
      'email': email,
      'phone': phone,
      'gender': gender,
      'imgUrl': imgUrl,
      'woreda': woreda,
      'city' : city,
      'region': region,
      'kebele': kebele,
      'subCity': subCity,
      'yearsWorked':yearsWorked,
      'houseNumber': houseNumber,
    };
  }
}







// class HonoraryMember {
//   String userID;
//   String fullName;
//   String dateOfBirth;
//   String userEmail;
//   String userPhoneNumber;
//   String homePhoneNumber;
//   String gender;
//   String nationality;
//   String martialStatus;
//   String regionBirth;
//   String cityBirth;
//   String woredaBirth;
//   String kebeleBirth;
//   String houseNumberBirth;
//   String subCityBirth;
//   String regionResidence;
//   String cityResidence;
//   String woredaResidence;
//   String kebeleResidence;
//   String houseNumberResidence;
//   String subCityResidence;
//   String postalCodeResidence;
//   String nameofInstitution;
//   String jobProffession;
//   String workRegion;
//   String workCity;
//   String workPObox;
//   String workSubCity;
//   String workWoreda;
//   String workKebele;
//   String workHouseNumber;
//   String dateofApplication = DateTime.now().toString();
//   String userImageURL;
//   /*String artistCategory;
//   String applicantStatus;*/
//   HonoraryMember({
//     required this.userID,
//     required this.fullName,
//     required this.dateOfBirth,
//     required this.userEmail,
//     required this.userPhoneNumber,
//     required this.homePhoneNumber,
//     required this.gender,
//     required this.nationality,
//     required this.martialStatus,
//     required this.regionBirth,
//     required this.cityBirth,
//     required this.woredaBirth,
//     required this.kebeleBirth,
//     required this.houseNumberBirth,
//     required this.subCityBirth,
//     required this.regionResidence,
//     required this.cityResidence,
//     required this.woredaResidence,
//     required this.kebeleResidence,
//     required this.houseNumberResidence,
//     required this.subCityResidence,
//     required this.postalCodeResidence,
//     required this.nameofInstitution,
//     required this.jobProffession,
//     required this.workRegion,
//     required this.workCity,
//     required this.workPObox,
//     required this.workSubCity,
//     required this.workWoreda,
//     required this.workKebele,
//     required this.workHouseNumber,
//     required this.userImageURL,
//     /*required this.artistCategory,
//     required this.applicantStatus,*/
//   });
//
//   HonoraryMember copyWith({
//     String? userID,
//     String? fullName,
//     String? dateOfBirth,
//     String? userEmail,
//     String? userPhoneNumber,
//     String? homePhoneNumber,
//     String? gender,
//     String? nationality,
//     String? martialStatus,
//     String? regionBirth,
//     String? cityBirth,
//     String? woredaBirth,
//     String? kebeleBirth,
//     String? houseNumberBirth,
//     String? subCityBirth,
//     String? regionResidence,
//     String? cityResidence,
//     String? woredaResidence,
//     String? kebeleResidence,
//     String? houseNumberResidence,
//     String? subCityResidence,
//     String? postalCodeResidence,
//     String? nameofInstitution,
//     String? jobProffession,
//     String? workRegion,
//     String? workCity,
//     String? workPObox,
//     String? workSubCity,
//     String? workWoreda,
//     String? workKebele,
//     String? workHouseNumber,
//     String? userImageURL,
//     /*String? artistCategory,
//     String? applicantStatus,*/
//   }) {
//     return HonoraryMember(
//       userID: userID ?? this.userID,
//       fullName: fullName ?? this.fullName,
//       dateOfBirth: dateOfBirth ?? this.dateOfBirth,
//       userEmail: userEmail ?? this.userEmail,
//       userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
//       homePhoneNumber: homePhoneNumber ?? this.homePhoneNumber,
//       gender: gender ?? this.gender,
//       nationality: nationality ?? this.nationality,
//       martialStatus: martialStatus ?? this.martialStatus,
//       regionBirth: regionBirth ?? this.regionBirth,
//       cityBirth: cityBirth ?? this.cityBirth,
//       woredaBirth: woredaBirth ?? this.woredaBirth,
//       kebeleBirth: kebeleBirth ?? this.kebeleBirth,
//       houseNumberBirth: houseNumberBirth ?? this.houseNumberBirth,
//       subCityBirth: subCityBirth ?? this.subCityBirth,
//       regionResidence: regionResidence ?? this.regionResidence,
//       cityResidence: cityResidence ?? this.cityResidence,
//       woredaResidence: woredaResidence ?? this.woredaResidence,
//       kebeleResidence: kebeleResidence ?? this.kebeleResidence,
//       houseNumberResidence: houseNumberResidence ?? this.houseNumberResidence,
//       subCityResidence: subCityResidence ?? this.subCityResidence,
//       postalCodeResidence: postalCodeResidence ?? this.postalCodeResidence,
//       nameofInstitution: nameofInstitution ?? this.nameofInstitution,
//       jobProffession: jobProffession ?? this.jobProffession,
//       workRegion: workRegion ?? this.workRegion,
//       workCity: workCity ?? this.workCity,
//       workPObox: workPObox ?? this.workPObox,
//       workSubCity: workSubCity ?? this.workSubCity,
//       workWoreda: workWoreda ?? this.workWoreda,
//       workKebele: workKebele ?? this.workKebele,
//       workHouseNumber: workHouseNumber ?? this.workHouseNumber,
//       userImageURL: userImageURL ?? this.userImageURL,
//      /* artistCategory: artistCategory ?? this.artistCategory,
//       applicantStatus: applicantStatus ?? this.applicantStatus,*/
//     );
//   }
//
//   Map<String, dynamic> toMap(HonoraryMember honoraryMember) {
//     return {
//       'userID': userID,
//       'fullName': fullName,
//       'dateOfBirth': dateOfBirth,
//       'userEmail': userEmail,
//       'userPhoneNumber': userPhoneNumber,
//       'homePhoneNumber': homePhoneNumber,
//       'gender': gender,
//       'nationality': nationality,
//       'martialStatus': martialStatus,
//       'regionBirth': regionBirth,
//       'cityBirth': cityBirth,
//       'woredaBirth': woredaBirth,
//       'kebeleBirth': kebeleBirth,
//       'houseNumberBirth': houseNumberBirth,
//       'subCityBirth': subCityBirth,
//       'regionResidence': regionResidence,
//       'cityResidence': cityResidence,
//       'woredaResidence': woredaResidence,
//       'kebeleResidence': kebeleResidence,
//       'houseNumberResidence': houseNumberResidence,
//       'subCityResidence': subCityResidence,
//       'postalCodeResidence': postalCodeResidence,
//       'nameofInstitution': nameofInstitution,
//       'jobProffession': jobProffession,
//       'workRegion': workRegion,
//       'workCity': workCity,
//       'workPObox': workPObox,
//       'workSubCity': workSubCity,
//       'workWoreda': workWoreda,
//       'workKebele': workKebele,
//       'workHouseNumber': workHouseNumber,
//       'userImageURL': userImageURL,
//       /*'artistCategory': artistCategory,
//       'applicantStatus': applicantStatus,*/
//     };
//   }
//
//   factory HonoraryMember.fromMap(Map<String, dynamic> map) {
//     return HonoraryMember(
//       userID: map['userID'] ?? '',
//       fullName: map['fullName'] ?? '',
//       dateOfBirth: map['dateOfBirth']??'',
//       userEmail: map['userEmail'] ?? '',
//       userPhoneNumber: map['userPhoneNumber']?.toDouble() ?? 0.0,
//       homePhoneNumber: map['homePhoneNumber']?.toDouble() ?? 0.0,
//       gender: map['gender'] ?? '',
//       nationality: map['nationality'] ?? '',
//       martialStatus: map['martialStatus'] ?? '',
//       regionBirth: map['regionBirth'] ?? '',
//       cityBirth: map['cityBirth'] ?? '',
//       woredaBirth: map['woredaBirth'] ?? '',
//       kebeleBirth: map['kebeleBirth'] ?? '',
//       houseNumberBirth: map['houseNumberBirth'] ?? '',
//       subCityBirth: map['subCityBirth'] ?? '',
//       regionResidence: map['regionResidence'] ?? '',
//       cityResidence: map['cityResidence'] ?? '',
//       woredaResidence: map['woredaResidence'] ?? '',
//       kebeleResidence: map['kebeleResidence'] ?? '',
//       houseNumberResidence: map['houseNumberResidence'] ?? '',
//       subCityResidence: map['subCityResidence'] ?? '',
//       postalCodeResidence: map['postalCodeResidence'] ?? '',
//       nameofInstitution: map['nameofInstitution'] ?? '',
//       jobProffession: map['jobProffession'] ?? '',
//       workRegion: map['workRegion'] ?? '',
//       workCity: map['workCity'] ?? '',
//       workPObox: map['workPObox']??'',
//       workSubCity: map['workSubCity'] ?? '',
//       workWoreda: map['workWoreda'] ?? '',
//       workKebele: map['workKebele'] ?? '',
//       workHouseNumber: map['workHouseNumber'] ?? '',
//       userImageURL: map['userImageURL'] ?? '',
//      /* artistCategory: map['artistCategory'] ?? '',
//       applicantStatus: map['applicantStatus'] ?? '',*/
//     );
//   }
//
//   String toJson() => json.encode(toMap(HonoraryMember(userID: userID, fullName: fullName, dateOfBirth: dateOfBirth, userEmail: userEmail, userPhoneNumber: userPhoneNumber, homePhoneNumber: homePhoneNumber, gender: gender, nationality: nationality, martialStatus: martialStatus, regionBirth: regionBirth, cityBirth: cityBirth, woredaBirth: woredaBirth, kebeleBirth: kebeleBirth, houseNumberBirth: houseNumberBirth, subCityBirth: subCityBirth, regionResidence: regionResidence, cityResidence: cityResidence, woredaResidence: woredaResidence, kebeleResidence: kebeleResidence, houseNumberResidence: houseNumberResidence, subCityResidence: subCityResidence, postalCodeResidence: postalCodeResidence, nameofInstitution: nameofInstitution, jobProffession: jobProffession, workRegion: workRegion, workCity: workCity, workPObox: workPObox, workSubCity: workSubCity, workWoreda: workWoreda, workKebele: workKebele, workHouseNumber: workHouseNumber, userImageURL: userImageURL)));
//
//   factory HonoraryMember.fromJson(String source) => HonoraryMember.fromMap(json.decode(source));
//
//   @override
//   String toString() {
//     return 'Applicant(userID: $userID, fullName: $fullName, dateOfBirth: $dateOfBirth, userEmail: $userEmail, userPhoneNumber: $userPhoneNumber, homePhoneNumber: $homePhoneNumber, gender: $gender, nationality: $nationality, martialStatus: $martialStatus, regionBirth: $regionBirth, cityBirth: $cityBirth, woredaBirth: $woredaBirth, kebeleBirth: $kebeleBirth, houseNumberBirth: $houseNumberBirth, subCityBirth: $subCityBirth, regionResidence: $regionResidence, cityResidence: $cityResidence, woredaResidence: $woredaResidence, kebeleResidence: $kebeleResidence, houseNumberResidence: $houseNumberResidence, subCityResidence: $subCityResidence, postalCodeResidence: $postalCodeResidence, nameofInstitution: $nameofInstitution, jobProffession: $jobProffession, workRegion: $workRegion, workCity: $workCity, workPObox: $workPObox, workSubCity: $workSubCity, workWoreda: $workWoreda, workKebele: $workKebele, workHouseNumber: $workHouseNumber, userImageURL: $userImageURL)';
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is HonoraryMember &&
//         other.userID == userID &&
//         other.fullName == fullName &&
//         other.dateOfBirth == dateOfBirth &&
//         other.userEmail == userEmail &&
//         other.userPhoneNumber == userPhoneNumber &&
//         other.homePhoneNumber == homePhoneNumber &&
//         other.gender == gender &&
//         other.nationality == nationality &&
//         other.martialStatus == martialStatus &&
//         other.regionBirth == regionBirth &&
//         other.cityBirth == cityBirth &&
//         other.woredaBirth == woredaBirth &&
//         other.kebeleBirth == kebeleBirth &&
//         other.houseNumberBirth == houseNumberBirth &&
//         other.subCityBirth == subCityBirth &&
//         other.regionResidence == regionResidence &&
//         other.cityResidence == cityResidence &&
//         other.woredaResidence == woredaResidence &&
//         other.kebeleResidence == kebeleResidence &&
//         other.houseNumberResidence == houseNumberResidence &&
//         other.subCityResidence == subCityResidence &&
//         other.postalCodeResidence == postalCodeResidence &&
//         other.nameofInstitution == nameofInstitution &&
//         other.jobProffession == jobProffession &&
//         other.workRegion == workRegion &&
//         other.workCity == workCity &&
//         other.workPObox == workPObox &&
//         other.workSubCity == workSubCity &&
//         other.workWoreda == workWoreda &&
//         other.workKebele == workKebele &&
//         other.workHouseNumber == workHouseNumber &&
//         other.userImageURL == userImageURL ;
//        /* other.artistCategory == artistCategory &&
//         other.applicantStatus == applicantStatus*/
//   }
//
//   @override
//   int get hashCode {
//     return userID.hashCode ^
//     fullName.hashCode ^
//     dateOfBirth.hashCode ^
//     userEmail.hashCode ^
//     userPhoneNumber.hashCode ^
//     homePhoneNumber.hashCode ^
//     gender.hashCode ^
//     nationality.hashCode ^
//     martialStatus.hashCode ^
//     regionBirth.hashCode ^
//     cityBirth.hashCode ^
//     woredaBirth.hashCode ^
//     kebeleBirth.hashCode ^
//     houseNumberBirth.hashCode ^
//     subCityBirth.hashCode ^
//     regionResidence.hashCode ^
//     cityResidence.hashCode ^
//     woredaResidence.hashCode ^
//     kebeleResidence.hashCode ^
//     houseNumberResidence.hashCode ^
//     subCityResidence.hashCode ^
//     postalCodeResidence.hashCode ^
//     nameofInstitution.hashCode ^
//     jobProffession.hashCode ^
//     workRegion.hashCode ^
//     workCity.hashCode ^
//     workPObox.hashCode ^
//     workSubCity.hashCode ^
//     workWoreda.hashCode ^
//     workKebele.hashCode ^
//     workHouseNumber.hashCode ^
//     userImageURL.hashCode ;
//   }
// }
