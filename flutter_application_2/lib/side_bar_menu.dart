// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/AdminProfileSetting/AdminProfile_page.dart';
import 'package:flutter_application_2/Applicant Management/Applicants.dart';
import 'package:flutter_application_2/Applicant%20Management/AppliManag_page.dart';
import 'package:flutter_application_2/Applicant%20Management/ApplicantManagementConsole.dart';
import 'package:flutter_application_2/Dashboard/dashboard.dart';
import 'package:flutter_application_2/Event%20Management/Create_Events.dart';
import 'package:flutter_application_2/Event%20Management/EventManagementConsole.dart';
import 'package:flutter_application_2/License/LicenseConsole.dart';
import 'package:flutter_application_2/License/LicenseConsolePage.dart';
import 'package:flutter_application_2/Member%20Management/MemberConsolePage.dart';
import 'package:flutter_application_2/Member%20Management/MemberManagementConsole.dart';
import 'package:flutter_application_2/News/AddNews.dart';
import 'package:flutter_application_2/News/News%20Management%20Console.dart';
import 'package:flutter_application_2/News/NewsConsole.dart';

import 'package:flutter_application_2/app_colors.dart';
import 'package:flutter_application_2/login_page.dart';
import 'package:flutter_application_2/Dashboard/home_page.dart';
import 'package:provider/provider.dart';

import 'AdminProfileSetting/NewAdminProfile.dart';
import 'Event Management/Create_Events_Page.dart';
import 'Event Management/EventManagementConsolePage.dart';
import 'License/RenewLicense.dart';
import 'License/Sample.dart';
import 'News/NewsConsolePage.dart';
import 'Services/AuthServiceAdmin.dart';
import 'consts.dart';
//import 'package:flutter_application_2/MemberManagement/member_managment_page.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Drawer(

      elevation: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height *0.2,
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Text(
                screenWidth(context) < 1000?"": "EDAA Admin",

                style: TextStyle(
                  color: AppColor.orange,
                  fontSize: MediaQuery.of(context).size.height *0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title:   screenWidth(context) < 1000?"": "DashBoard",
              icon: Icons.dashboard,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },

            ),





            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title: screenWidth(context) < 1000?"":  "News",
              icon: Icons.perm_device_information,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                      create: (context)=>DbContext(),
                        child: NewsConsolePage())));
              },

            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title: screenWidth(context) < 1000?"":  "Events",
              icon: Icons.event,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                      create: (context)=>DbContext(),
                        child: EventManagementConsolePage())));
              },

            ),







            SizedBox(
              height: 10,
            ),
            DrawerListTitle(

              title: screenWidth(context) < 1000?"":  "Member Management",
              icon: Icons.people,
              press: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(create:(context)=>DbContext(),child: MemberConsolePage())));
              },
            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(

              title:  screenWidth(context) < 1000?"": "Applicants",
              icon: Icons.people,
              press: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                      create: (context)=>DbContext(),
                        child: (ApplicantManagementPage()))));
              },
            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title: screenWidth(context) < 1000?"":  "License",
              icon: Icons.card_membership,
              press: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                        create: (context) => DbContext(),
                        child: (LicenseConsolePage()))));


              },
            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title:  screenWidth(context) < 1000?"": "Settings",
              icon: Icons.settings,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context)=>DbContext(),
                            child: Sample())));
              },
            ),
            SizedBox(
              height: 10,
            ),
            DrawerListTitle(
              title: screenWidth(context) < 1000?"":  "Logout",
              icon: Icons.logout,
              press: () async {
              await dbContext.adminLogout()
              .then((value) =>  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                    create: (context)=>DbContext(),
                      child: LoginPage()))))
                  .catchError((onError)=>print(onError));

              },
            ),

            // Spacer(),
            // Expanded(
            //   flex: 8,
            //   child:
            //   Image.asset('images/websitelogo.png') ,
            // )

          ],
        ),
      ),
    );
  }
}

class DrawerListTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  const DrawerListTitle(
      {Key? key, required this.title, required this.icon, required this.press});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      iconColor: Colors.white,
      leading: Icon(icon),
      horizontalTitleGap: 0.0,
      title: Text(
        title,
        style: TextStyle(
            color: AppColor.white, fontSize: 15, fontFamily: 'Poppins'),
      ),
    );
  }
}
