import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/License.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';
import 'dart:math';

import '../app_colors.dart';

class Certify extends StatefulWidget {
  Random myRand = Random();
  String uid;
  String fullName;
  String occupation;
  String email;
  String phone;
  String issueDate;
  String expireDate;
  String imgUrl;
  String subCity;
  String address;
  String woreda;
  String houseNumber;
  String status;

  @override
  _CertifyState createState() => _CertifyState();

  Certify({
    required this.uid,
    required this.fullName,
    required this.occupation,
    required this.email,
    required this.phone,
    required this.issueDate,
    required this.expireDate,
    required this.imgUrl,
    required this.address,
    required this.subCity,
    required this.woreda,
    required this.houseNumber,
    required this.status,
  });
}

class _CertifyState extends State<Certify> {
  TextStyle style = TextStyle(
    fontSize: 22,
    fontFamily: 'Poppins',
    color: AppColor.orange,
  );
 late String licenseId;

  String generateId()
  {
    var mUuid = Uuid();
    String randomId =  mUuid.v1();

    return randomId.substring(32);
  }
 


  @override
  Widget build(BuildContext context) {

    
    //int randomId = widget.myRand.nextInt(90) + 10;
    TextEditingController mController = TextEditingController();
    mController.text = generateId();
    final dbContext = Provider.of<DbContext>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Container(
        //margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 0.1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image(
                    height: 50,
                    width: 50,
                    image: AssetImage("images/logo.png"),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Ethiopian Dance Art association",
                      style: style.copyWith(fontSize: 11),
                    ),
                    Text(
                      "የኢትዮጵያ ተወዛዋዦች ጥበብ ማህበር",
                      style: style.copyWith(fontSize: 10),
                    ),
                    Text(
                      "ስልክ:- +251 911 547577 / +251 911 403456",
                      style: style.copyWith(fontSize: 9),
                    ),
                  ],
                ),
                Container()
              ],
            ),
            Divider(
              color: Colors.red,
              thickness: 4,
            ),
            Center(child: Text("የአባልነት መታወቂያ ካርድ")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.35,
                  image: NetworkImage(widget.imgUrl),
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: style.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 10),
                            ),
                            Text(
                              widget.fullName,
                              style: style.copyWith(fontSize: 10),
                            ),
                            SizedBox()
                          ],
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "           ",
                                style: TextStyle(fontSize: 10),
                              ),
                              Expanded(
                                  child: Divider(
                                height: 0,
                                thickness: 3,
                              )),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Occupation",
                                  style: style.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.occupation,
                                  style: style.copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox()
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "           ",
                              style: TextStyle(fontSize: 10),
                            ),
                            Expanded(
                              child: Divider(
                                height: 0,
                                thickness: 3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text('የመ.ተ.ቁ.',
                style:
                    style.copyWith(fontWeight: FontWeight.w500, fontSize: 10)),
            Row(
              children: [
                Text(
                  'ID No',
                  style:
                      style.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                      readOnly: true,
                    controller: mController ,
                    style: TextStyle(
                      color: AppColor.orange,
                      //fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",

                     // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.red,
              thickness: 4,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("email:-  " + widget.email,
                      style: style.copyWith(fontSize: 10)),
                  SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Text(
                            "የተሰጠበት ቀን",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Issue Date",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.issueDate.toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            widget.issueDate.toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "የሚያበቃበት ",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "Expiry",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.expireDate.toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            widget.expireDate.toString().substring(0, 10),
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
           // SizedBox(height: 50),
            Center(
              child: RaisedButton(
                  color: Color(0xFFEF8242),
                  textColor: Colors.white,
                  onPressed: () async {
                    bool exist = await dbContext.checkLicense(widget.uid);
                    if (exist == true) {
                      Alert(
                          context: context,
                          type: AlertType.error,
                          desc: 'This member is already licensed')
                          .show();
                    }
                    else
                      {
                        bool idExists = await dbContext.checkLicenseId(generateId());
                        if(idExists)
                          {

                            setState(() {
                              generateId();
                            });
                          }
                        else
                          {
                            License myLicense = License(
                                fullName: widget.fullName,
                                occupation: widget.occupation,
                                licenseId: mController.text,
                                email: widget.email,
                                phone: widget.phone,
                                issueDate: widget.issueDate.toString(),
                                expiryDate: widget.expireDate.toString(),
                                imgUrl: widget.imgUrl,
                                uid: widget.uid,
                                status: 'Enabled',
                                address: widget.address,
                                subCity: widget.subCity,
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

                      }
                  },
                  child: Text('Certify')),
            ),
          ],
        ),
      ),
    );
  }
}
