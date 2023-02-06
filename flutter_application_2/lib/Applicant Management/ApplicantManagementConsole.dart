
import 'package:flutter/material.dart';
import '/Applicant%20Management/ModDance_Page.dart';
import '/Applicant%20Management/ModerChoerog.dart';
import '/Applicant%20Management/ModernChoreographerApplicants.dart';
import '/Applicant%20Management/ModernDancerApplicants.dart';
import '/Applicant%20Management/TradChoreoApp.dart';
import '/Applicant%20Management/TradDanApp_page.dart';
import '/Applicant%20Management/TraditionalChoreographerApplicants.dart';
import '/Applicant%20Management/TraditionalDancerApplicants.dart';
import '/Member%20Management/ModernDancers.dart';
import '/Member%20Management/TraditionalDancers.dart';
import '/Services/AuthServiceAdmin.dart';
import '/app_colors.dart';
import 'package:provider/provider.dart';

import 'Applicants.dart';

class ApplicantManagementConsole extends StatefulWidget {
  @override
  _ApplicantManagementConsoleState createState() =>
      _ApplicantManagementConsoleState();
}

//
class _ApplicantManagementConsoleState
    extends State<ApplicantManagementConsole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Applicants",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border(
                            top: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (contex) => DbContext(),
                                    child: TraditionalDancerApplicantPage())));
                      },
                      child: const Text('Traditional Dancers',
                          textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle: const TextStyle(
                              fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border(
                            top: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (context) => DbContext(),
                                    child: ModDancePage())));
                      },
                      child: const Text('Modern Dancers',
                          textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle: const TextStyle(
                              fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border(
                            top: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (context) => DbContext(),
                                    child: TradChoreo())));
                      },
                      child: const Text('Traditional Chereographers',
                          textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle: const TextStyle(
                              fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {},
                  child: Container(
    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border(
                            top: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            left: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            right: BorderSide(
                                width: 1,
                                color: AppColor.bgSideMenu,
                                style: BorderStyle.solid),
                            bottom: BorderSide(
                                color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (context) => DbContext(),
                                    child: ModernChorog())));
                      },
                      child: const Text('Modern Chereographers',
                          textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle: const TextStyle(
                              fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
