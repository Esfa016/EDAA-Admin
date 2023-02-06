import 'package:flutter/material.dart';
import '/Applicant%20Management/ModernChoreographerApplicants.dart';
import '/Applicant%20Management/TraditionalChoreographerApplicants.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class TradChoreo extends StatefulWidget {
  @override
  _TradChoreoState createState() => _TradChoreoState();
}

class _TradChoreoState extends State<TradChoreo> {
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
                  child: TraditionalChoreographerApplicants()),
            ),
          ],
        ),
      ),
    );
  }
}
