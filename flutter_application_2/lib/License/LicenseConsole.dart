import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/EnableDisablePage.dart';
import 'package:flutter_application_2/License/RemoveLicensePage.dart';
import 'package:flutter_application_2/License/RenewLicense.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:flutter_application_2/app_colors.dart';
import 'package:flutter_application_2/side_bar_menu.dart';
import 'package:provider/provider.dart';

import 'Renew.dart';
import 'RenewLicensePage.dart';
import 'RenewPage.dart';
class LicenseConsole extends StatefulWidget {
  @override
  _LicenseConsoleState createState() => _LicenseConsoleState();
}

class _LicenseConsoleState extends State<LicenseConsole> {
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
              "Manage License",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Padding(
          // padding: EdgeInsets.only(top: 30),
          // ),
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
                            bottom:
                            BorderSide(color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(create:(contex)=>DbContext(),child: RenewPage())));
                      },
                      child: const Text('RenewLicense',
                          textAlign: TextAlign.center
                      ),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle:
                          const TextStyle(fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  child: Container(
                    width:MediaQuery.of(context).size.width * 0.2,
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
                            bottom:
                            BorderSide(color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                            create: (context)=>DbContext(),
                            child: EnableDisablePage())));
                      },
                      child:
                      const Text('Enable/Disable Status', textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle:
                          const TextStyle(fontSize: 15, fontFamily: 'Poppins')),
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
                            bottom:
                            BorderSide(color: AppColor.bgSideMenu, width: 1))),
                    padding: EdgeInsets.only(bottom: 5),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                      onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                          create: (context)=>DbContext(),
                          child: RemoveLicensePage())));
                      },
                      child: const Text('Remove License',
                          textAlign: TextAlign.center),
                      style: TextButton.styleFrom(
                          primary: AppColor.orange,
                          textStyle:
                          const TextStyle(fontSize: 15, fontFamily: 'Poppins')),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
