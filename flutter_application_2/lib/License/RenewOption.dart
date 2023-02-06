import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

class RenewOption extends StatefulWidget {
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
  _RenewOptionState createState() => _RenewOptionState();

  RenewOption({
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

class _RenewOptionState extends State<RenewOption> {
  DateTime compareDate = new DateTime.now();
  late String exp;
  late DateTime expiryDate;


  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Scaffold(

      appBar: AppBar
        (
        title: Text('Renew License'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.imgUrl),),
            SizedBox(height: 5,),
            Text(widget.FullName),
            SizedBox(height: 5,),
            Text(widget.LicenseId),
            SizedBox(height: 5,),
            Text(widget.Occupation),
            SizedBox(height: 5,),
            ElevatedButton(onPressed: (){
               expiryDate = DateTime.parse(widget.ExpiryDate);
               if(expiryDate.isAfter(compareDate))
                 {
                   Alert( context: context, type: AlertType.info, desc: 'Already up to date').show();
                 }
               else
                 {
                   dbContext.updateLicense(widget.uid);
                   Alert( context: context, type: AlertType.info, desc: 'Successfull').show();

                 }

            }, child: Text('Renew'))
          ],
        ),
      ),
      );


  }
}
