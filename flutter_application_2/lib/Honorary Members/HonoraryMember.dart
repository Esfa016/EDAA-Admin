import 'package:flutter/material.dart';

import 'package:flutter_application_2/Honorary%20Members/HonoraryMemberConsole.dart';
import 'package:flutter_application_2/Honorary%20Members/RegisterHonoraryMembers.dart';
import 'package:flutter_application_2/Member%20Management/MemberConsolePage.dart';
import 'package:flutter_application_2/Member%20Management/MemberManagementConsole.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class HonoraryMember extends StatefulWidget {
  @override
  _HonoraryMemberState createState() => _HonoraryMemberState();
}

class _HonoraryMemberState extends State<HonoraryMember> {
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
    flex: 5,
    child: ChangeNotifierProvider(
      create: (context)=>DbContext(),
        child: HonoraryMemberConsole()),
    ),
    //   Container(
    //   margin: EdgeInsets.all(10),
    //   child: Row(
    //     children: [
    //       IconButton(
    //         icon: Icon(Icons.arrow_back),
    //         onPressed: () {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => MemberConsolePage()));
    //         },
    //       ),
    //       Text(
    //         "Honorary Members",
    //         style: TextStyle(
    //           fontFamily: 'Poppins',
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.only(right: 30)),
    //       SizedBox(
    //         width: 500,
    //         child: TextField(
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(20.0),
    //               borderSide: BorderSide(
    //                 color: Color(0xFFEF8242),
    //               ),
    //             ),
    //             hintText: 'Search for honorary members',
    //             hintStyle: TextStyle(
    //               color: Color(0xFFEF8242),
    //               fontSize: 22,
    //               fontFamily: 'Poppins',
    //             ),
    //             suffixIcon: Icon(
    //               Icons.search,
    //               size: 22,
    //               color: Color(0xFFEF8242),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(padding: EdgeInsets.only(right: 30)),
    //       Container(
    //         decoration: BoxDecoration(
    //             color: AppColor.orange,
    //             borderRadius: BorderRadius.circular(100)),
    //         child: TextButton(
    //           onPressed: () {
    //             Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => RegisterHonoraryMembers()));
    //           },
    //           child: Text(
    //             "Register",
    //             style: TextStyle(
    //               fontFamily: 'Poppins',
    //               fontWeight: FontWeight.bold,
    //               color: AppColor.black,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  ]
    )
    )
    );
  }
}
