import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/app_colors.dart';
class ApplicantCheck extends StatefulWidget {
  // String userID;
  // String fullName;
  // String dateOfBirth;
  // String userEmail;
  // String userPhoneNumber;
  // // String homePhoneNumber;
  // String gender;
  // String nationality;
  // String martialStatus;
  // String regionBirth;
  // String cityBirth;
  // String woredaBirth;
  // String kebeleBirth;
  // String houseNumberBirth;
  // String subCityBirth;
  // String regionResidence;
  // String cityResidence;
  // String woredaResidence;
  // String kebeleResidence;
  // String houseNumberResidence;
  // String subCityResidence;
  // String postalCodeResidence;
  // String nameofInstitution;
  // String jobProffession;
  // String workRegion;
  // String workCity;
  // String workPObox;
  // String workSubCity;
  // String workWoreda;
  // String workKebele;
  // String workHouseNumber;
  // String userImageURL;
  @override
  _ApplicantCheckState createState() => _ApplicantCheckState();

  // ApplicantCheck({
  //   required this.userID,
  //   required this.fullName,
  //   required this.dateOfBirth,
  //   required this.userEmail,
  //   required this.userPhoneNumber,
  //   required this.gender,
  //   required this.nationality,
  //   required this.martialStatus,
  //   required this.regionBirth,
  //   required this.cityBirth,
  //   required this.woredaBirth,
  //   required this.kebeleBirth,
  //   required this.houseNumberBirth,
  //   required this.subCityBirth,
  //   required this.regionResidence,
  //   required this.cityResidence,
  //   required this.woredaResidence,
  //   required this.kebeleResidence,
  //   required this.houseNumberResidence,
  //   required this.subCityResidence,
  //   required this.postalCodeResidence,
  //   required this.nameofInstitution,
  //   required this.jobProffession,
  //   required this.workRegion,
  //   required this.workCity,
  //   required this.workPObox,
  //   required this.workSubCity,
  //   required this.workWoreda,
  //   required this.workKebele,
  //   required this.workHouseNumber,
  //   required this.userImageURL,
  // });
}

class _ApplicantCheckState extends State<ApplicantCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicant Details'),
        backgroundColor: AppColor.orange,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Applicant Name'),
                        Text('name')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Applicant Name'),
                        Text('name')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Applicant Name'),
                        Text('name')
                      ],
                    ),
                  ],
                )
              ],
            ),

          ),
        ),
      ),
    );
  }
}
