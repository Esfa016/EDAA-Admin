import 'dart:core';

import 'package:flutter/material.dart';

import '../app_colors.dart';

class Approval_Page extends StatefulWidget {

  String userID;
      String

  fullName

  ;


  String dateOfBirth;
  String userEmail;


  String userPhoneNumber;

  // String homePhoneNumber;
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

  @override
  _Approval_PageState createState() => _Approval_PageState();

  Approval_Page({
    required this.userID,
    required this.fullName,
    required this.dateOfBirth,
    required this.userEmail,
    required this.userPhoneNumber,
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
    required this.userImageURL,
    required this.artistCategory,
    required this.cvURL,
    required this.youtubeLink,
  });
}

class _Approval_PageState extends State<Approval_Page> {


  @override
  Widget build(BuildContext context) {

    BoxDecoration boxDecoration = BoxDecoration(

      borderRadius: BorderRadius.circular(10),
    );

    TextStyle textDecoration = TextStyle(
        fontFamily: "Poppins",
        letterSpacing: 0.5,
        fontSize: 12.7,
        overflow: TextOverflow.ellipsis,
        //decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
        color: AppColor.orange);

    return Scaffold(
      body: Container(
        width: 500,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(30),
        ),
        child: Expanded(
          child: Container(
                width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Center(
                  child: Container(

                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(right: 10),

                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.all(10),
                        //   height: MediaQuery.of(context).size.height * 0.18,
                        //   width: MediaQuery.of(context).size.height * 0.15,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       // shape: BoxShape.circle,
                        //       image: DecorationImage(
                        //           image: AssetImage("assets/melaku.jpeg"),
                        //           fit: BoxFit.cover)),
                        //   child: GestureDetector(
                        //     onTap: () {},
                        //   ),
                        // ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.userImageURL),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.fullName, style: textDecoration),
                            SizedBox(
                              height: 2,
                            ),
                            Text( widget.userPhoneNumber, style: textDecoration),
                            SizedBox(
                              height: 2,
                            ),
                            // Row(
                            //   children: [
                            //     Text("31 years old" , style: textDecoration),
                            //     Text(
                            //       "    ( " + "10/12/1990" + " )",
                            //       style: TextStyle(
                            //           fontSize: 12,
                            //           fontWeight: FontWeight.bold,
                            //           fontFamily: "Poppins",
                            //           color: Theme.of(context)
                            //               .primaryColor
                            //               .withOpacity(0.7)),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(widget.userEmail, style: textDecoration),
                            const SizedBox(
                              height: 2,
                            ),
                            Text( widget.gender, style: textDecoration),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(

                    decoration: boxDecoration,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Place of Birth",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("City: " + widget.cityBirth , style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Sub-City: " + widget.subCityBirth, style: textDecoration),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Region: " + widget.regionBirth, style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Woreda   " + "no: "  + widget.woredaBirth, style: textDecoration),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(

                    decoration: boxDecoration,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              "Place of Residence",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("City: " + widget.cityResidence, style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Sub-City: " + widget.subCityResidence, style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Kebele    " + "nmbr: " + widget.kebeleResidence,
                                      style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("House no    " + "nmbr: " + widget.houseNumberResidence,
                                      style: textDecoration),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Region: "  + widget.regionResidence, style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Woreda   " + "no: " + widget.woredaResidence, style: textDecoration),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("Postal Code   " + "no: " +  widget.postalCodeResidence,
                                      style: textDecoration),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(

                    decoration: boxDecoration,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Text(
                              "Place of Work",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name of Institution: " + widget.nameofInstitution,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              Text("name of insti", style: textDecoration),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Job Profession: " + widget.jobProffession,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.7),
                                ),
                              ),
                              // Text("Soccer player" , style: textDecoration),
                              // SizedBox(
                              //   height: 8,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("City: " + widget.workCity, style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Sub-City: " + widget.workSubCity, style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Kebele    " + "nmbr: " + widget.workKebele,
                                          style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("House no    " + "nmbr: " + widget.workHouseNumber,
                                          style: textDecoration),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Region: "+ widget.workRegion, style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Woreda   " + "no: " + widget.workWoreda,
                                          style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Postal Code   " + "no" + widget.workPObox ,
                                          style: textDecoration),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Tel: " , style: textDecoration),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
