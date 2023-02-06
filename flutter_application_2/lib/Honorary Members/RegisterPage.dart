import 'package:flutter/material.dart';
import 'package:flutter_application_2/Honorary%20Members/Register.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class RegisterHonoraryPage extends StatefulWidget {
  @override
  _RegisterHonoraryPageState createState() => _RegisterHonoraryPageState();
}

class _RegisterHonoraryPageState extends State<RegisterHonoraryPage> {
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
                  child: RegisterHononrary()),
            ),
          ],
        ),
      ),
    );;
  }
}
