import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/RenewOption.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
import 'RenewLicense.dart';
class RenewPageOption extends StatefulWidget {
  String FullName;
  String Occupation;
  String LicenseId;
  String Email;
  String Phone;
  String  IssueDate;
  String ExpiryDate;
  String imgUrl;
  String uid;
  String Address;
  String Woreda;
  String HouseNumber;

  String status;

  @override
  _RenewPageOptionState createState() => _RenewPageOptionState();

  RenewPageOption({
    required this.FullName,
    required this.Occupation,
    required this.LicenseId,
    required this.Email,
    required this.Phone,
    required this.IssueDate,
    required this.ExpiryDate,
    required this.imgUrl,
    required this.uid,
    required this.Address,
    required this.Woreda,
    required this.HouseNumber,
    required this.status,
  });
}

class _RenewPageOptionState extends State<RenewPageOption> {
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
                  child: RenewOption(
                    FullName: widget.FullName,
                    Occupation: widget.Occupation,
                    LicenseId: widget.LicenseId,
                    Email: widget.Email,
                    Phone: widget.Phone,
                    IssueDate: widget.IssueDate,
                    ExpiryDate: widget.ExpiryDate,
                    imgUrl: widget.imgUrl,
                    uid: widget.uid,
                    Address: widget.Address,
                    Woreda: widget.Woreda,
                    HouseNumber: widget.HouseNumber,
                    status: widget.status,
                  ),
            ),
            )],
        ),
      ),
    );;;;
  }
}
