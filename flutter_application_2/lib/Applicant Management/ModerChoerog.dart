import 'package:flutter/material.dart';
import '/Applicant%20Management/ModernChoreographerApplicants.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class ModernChorog extends StatefulWidget {
  @override
  _ModernChorogState createState() => _ModernChorogState();
}

class _ModernChorogState extends State<ModernChorog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: ModernChoreographerApplicants()),
            ),
          ],
        ),
      ),
    );
  }
}
