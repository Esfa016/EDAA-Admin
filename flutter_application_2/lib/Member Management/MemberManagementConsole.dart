import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Honorary%20Members/HonoraryMember.dart';
import 'package:flutter_application_2/Member%20Management/ModernDancerMemberPage.dart';
import 'package:flutter_application_2/Member%20Management/TraditionalChoreographerMemberPage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:flutter_application_2/app_colors.dart';
import 'package:provider/provider.dart';

import 'ModernChoreographerPage.dart';
import 'TradDancerMemberPage.dart';

class MemberManagementConsole extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              "Members",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      child: TradDancerMemeberPage())));
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
                  SizedBox(
                    height: 20,
                  ),
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
                                      child: ModernDancerMemeberPage())));
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
                  SizedBox(
                    height: 20,
                  ),
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
                                      child:
                                          TraditionalChoreographerMemberPage())));
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
                  SizedBox(
                    height: 20,
                  ),
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
                                      child: ModernChoreographerPage())));
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
                  SizedBox(
                    height: 20,
                  ),
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
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangeNotifierProvider(
                                      create: (context) => DbContext(),
                                      child: HonoraryMember())));
                        },
                        child: const Text('Honorary Members',
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
          ),
        ],
      ),
    );
  }
}
