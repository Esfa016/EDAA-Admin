import 'package:flutter/material.dart';
import '/Applicant%20Management/ModernDancerApplicants.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
import 'ApplicantManagementConsole.dart';
class ModDancePage extends StatefulWidget {
  @override
  _ModDancePageState createState() => _ModDancePageState();
}

class _ModDancePageState extends State<ModDancePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side Navigation Menu
            Expanded(
              child: SideBar(),
            ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: ChangeNotifierProvider(
                  create: (context)=>DbContext(),
                  child: ModernDancerApplicant()),
            ),
          ],
        ),
      ),
    );;
  }
}
