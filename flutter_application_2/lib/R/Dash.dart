import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter_application_2/Applicant%20Management/ApplicantManagementConsole.dart';
import 'package:flutter_application_2/Dashboard/dash.dart';
import 'package:flutter_application_2/Event%20Management/EventManagementConsole.dart';
import 'package:flutter_application_2/License/LicenseConsole.dart';
import 'package:flutter_application_2/Member%20Management/MemberManagementConsole.dart';
import 'package:flutter_application_2/News/NewsConsole.dart';
import 'package:flutter_application_2/News/NewsConsolePage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';

class DashNew extends StatefulWidget {


  @override
  _DashNewState createState() => _DashNewState();
}

class _DashNewState extends State<DashNew> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(

            controller: page,
            style: SideMenuStyle(
              displayMode:SideMenuDisplayMode.compact,
              //hoverColor: Colors.blue[100],
              unselectedIconColor: Colors.white,
             // selectedColor: Colors.lightBlue,

              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
                backgroundColor:AppColor.bgSideMenu,

              // openSideMenuWidth: 200
            ),
            title: Column(
              children: [
                // ConstrainedBox(
                //   constraints: BoxConstraints(
                //     maxHeight: 150,
                //     maxWidth: 150,
                //   ),
                //   child: Image.asset(
                //     'images/logo.png',
                //   ),
                // ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(

                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                  //page.dispose();
                },
                icon: Icons.home,
              ),
              SideMenuItem(
                priority: 1,
                title: 'News',
                onTap: () {
                  page.jumpToPage(1);
//page.dispose();
},
                icon: Icons.tv,
              ),
              SideMenuItem(
                priority: 2,
                title: 'Event',
                onTap: () {
                  page.jumpToPage(2);
                  //page.dispose();
                },
                icon: Icons.event,
              ),
              SideMenuItem(

                priority: 3,
                title: 'Applicant Management',
                onTap: () {
                  page.jumpToPage(3);
                  //page.dispose();
                },
                icon: Icons.person_add,
              ),
              SideMenuItem(
                priority: 4,
                title: 'Member Management',
                onTap: () {
                  page.jumpToPage(4);
                  //page.dispose();
                },
                icon: Icons.person,
              ),
              SideMenuItem(
                priority: 5,
                title: 'License Management',
                onTap: () {
                  page.jumpToPage(5);
                 // page.dispose();
                },
                icon: Icons.card_membership,
              ),

              // SideMenuItem(
              //   priority: 6,
              //   title: 'Exit',
              //   onTap: () async {},
              //   icon: Icons.exit_to_app,
              // ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                DashboardNew(),
                ChangeNotifierProvider(
                  create: (context)=>DbContext(),
                    child: NewsConsole()),
                ChangeNotifierProvider(
                  create: (context)=>DbContext(),
                    child: EventManagementConsole()),
                ApplicantManagementConsole(),
                ChangeNotifierProvider(
                  create: (context)=>DbContext(),
                    child: MemberManagementConsole()),
                ChangeNotifierProvider(
                    create: (context)=>DbContext(),
                    child: LicenseConsole())

              ],
            ),
          ),
        ],
      ),
    );
  }
}