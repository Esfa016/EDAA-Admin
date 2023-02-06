import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/License.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GenerateLicense extends StatefulWidget {
  String uid;
  String fullName;
  String occupation;
  String email;
  String phone;
  String issueDate;
  String expireDate;
  String imgUrl;
  String address;
  String woreda;
  String houseNumber;
  String status;
  String subCity;

  @override
  _GenerateLicenseState createState() => _GenerateLicenseState();

  GenerateLicense({
    required this.uid,
    required this.fullName,
    required this.occupation,
    required this.email,
    required this.phone,
    required this.issueDate,
    required this.expireDate,
    required this.imgUrl,
    required this.address,
    required this.woreda,
    required this.houseNumber,
    required this.status,
    required this.subCity
  });
}

class _GenerateLicenseState extends State<GenerateLicense> {
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    TextEditingController licenseID = TextEditingController();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.imgUrl),
            ),
            Text('Name ' + widget.fullName),
            Text('occupation' + widget.occupation),
            Text('email' + widget.email),
            TextField(
              decoration: InputDecoration(labelText: 'License ID:'),
              controller: licenseID,
            ),
            ElevatedButton(
                onPressed: () {
                  if (licenseID.text.isEmpty) {
                    print('no null');
                  } else {
                    License myLicense = License(
                        fullName: widget.fullName,
                        occupation: widget.occupation,
                        licenseId: licenseID.text,
                        email: widget.email,
                        phone: widget.phone,
                        issueDate: widget.issueDate.toString(),
                        expiryDate: widget.expireDate.toString(),
                        subCity: widget.subCity.toString(),
                        imgUrl: widget.imgUrl,
                        uid: widget.uid,
                        status: 'Enabled',
                        address: widget.address,
                        woreda: widget.woreda,
                        houseNumber: widget.houseNumber);
                    dbContext
                        .generateLicense(myLicense)
                        .then((value) => {
                              Alert(
                                      context: context,
                                      type: AlertType.info,
                                      desc: 'Successfull')
                                  .show()
                            })
                        .catchError((onError) => {
                              Alert(
                                      context: context,
                                      type: AlertType.info,
                                      desc: 'Error formed')
                                  .show()
                            });
                  }
                },
                child: Text('Certify on your own risk!!')),
          ],
        ),
      ),
    );
  }
}
