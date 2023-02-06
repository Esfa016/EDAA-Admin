import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/Certify.dart';
import 'package:flutter_application_2/License/CertifyPage.dart';
import 'package:flutter_application_2/License/GenerateLicense.dart';
import 'package:flutter_application_2/Models/License.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../app_colors.dart';
import 'MemberConsolePage.dart';
class ModernChoreographers extends StatefulWidget {
  TextEditingController search = TextEditingController();
  DateTime issueDate = new DateTime.now();
  DateTime  expiryDate =  DateTime(DateTime.now().year+ 2,DateTime.now().month,DateTime.now().day);
  String issueString = DateTime.now().toString();

  String expiryString =DateTime(DateTime.now().year+ 2,DateTime.now().month,DateTime.now().day).toString();
  @override
  _ModernChoreographersState createState() => _ModernChoreographersState();
}

class _ModernChoreographersState extends State<ModernChoreographers> {
  TextStyle style= TextStyle(
    fontSize: 22,
    fontFamily: 'Poppins',
    color: AppColor.orange,
  );
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Container(

      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.bgColor,
        borderRadius: BorderRadius.circular(30),),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNotifierProvider(
                              create: (context) => DbContext(),
                              child: MemberConsolePage())));
                  // Interactivity or events codes here
                },
              ),
            ],

          ),
          // Divider(
          //   thickness: 2,
          //   color: AppColor.orange,
          // ),
          Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextField(
                controller: widget.search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEF8242),
                    ),
                  ),
                  hintText: 'Search for modern Choreographers',
                  hintStyle: TextStyle(
                    color: Color(0xFFEF8242),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){
                      dbContext.fetchModernChoreographersByName(widget.search.text.trim());
                    },
                    icon: Icon(Icons.search,size: 22,) ,

                    color: Color(0xFFEF8242),
                  ),
                ),
              ),
            ),
          ),
          // TextField(
          //   decoration: InputDecoration(
          //       labelText: 'Search '
          //   ),
          //   controller: widget.search,
          // ),
          // ElevatedButton(
          //   onPressed: (){
          //     dbContext.fetchLicense(widget.search.text.trim());
          //   }, child: Text('Search'),
          // ),
          StreamBuilder<QuerySnapshot>(

              stream: dbContext.fetchModernChoreographersByName(widget.search.text.trim()),
              //stream: FirebaseFirestore.instance.collection('Admins').snapshots(),
              builder: (context,snapshot)
              {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    ),
                  );
                } else if (snapshot.data!.docs.length.toString() == "0") {
                  return Center(
                      child: Container(
                          child: Text(
                            'could not find member',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          )));
                }
                else if(snapshot.hasData || snapshot.data!=null)
                {

                  return       Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index)
                        {
                          QueryDocumentSnapshot<Object?> documentSnapshot = snapshot.data!.docs[index];
                          return Dismissible(
                            key: Key(index.toString()),
                            child: Card(
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10,
                              shadowColor: AppColor.orange,
                              // elevation: 5,
                              child: ListTile(
                                leading: CircleAvatar(backgroundImage: NetworkImage(documentSnapshot['userImageURL']),),
                                title: Text(
                                  documentSnapshot['fullName'],
                                  style: TextStyle(
                                    color: AppColor.orange,
                                  ),
                                  textScaleFactor: 1.5,
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                            create: (context)=>DbContext(),
                                            child: CertifyPage(
                                                uid: documentSnapshot['userID'],
                                                fullName: documentSnapshot['fullName'],
                                                occupation: documentSnapshot['artistCategory'],
                                                email:documentSnapshot['userEmail'],
                                                phone:  documentSnapshot['userPhoneNumber'],
                                                issueDate:  widget.issueDate.toString(),
                                                expireDate: widget.expiryDate.toString(),
                                                imgUrl: documentSnapshot['userImageURL'],
                                                address: documentSnapshot['cityResidence'],
                                                subCity: documentSnapshot['subCityResidence'],
                                                woreda:    documentSnapshot['woredaResidence'],
                                                houseNumber: documentSnapshot['houseNumberResidence'],
                                                status: 'Enabled'),
                                          )));

                                        },

                                        icon: Icon(Icons.check, color: AppColor.orange)),
                                    Text(
                                      'Certify',
                                      style: TextStyle(
                                        color: AppColor.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  documentSnapshot['artistCategory'],
                                  style: TextStyle(
                                    color: AppColor.orange,
                                  ),
                                ),
                                //selected: true,
                                onTap: () {
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (context) => MemberProfile()));
                                },
                              ),
                            ),
                          );

                        }

                    ),
                  );
                }
                else if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    ),
                  );
                }

                else
                {
                  return Text('Something went wrong...try again');
                }
              }


          ),

        ],
      ),
    );
  }

  showGenerateFunction(context, String uid,
  String fullName,
  String occupation,
  String email,
  String phone,
  String issueDate,
  String expireDate,
  String imgUrl,
  String subCity,
  String address,
  String woreda,
  String houseNumber,
  String status,
  )
  {
    return showDialog(context: context,
        builder: (context)
        { TextEditingController licenseId = TextEditingController();
          final dbContext = DbContext();
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.7 ,
                child:
                Container(

                  //margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.bgColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 0.1,
                        offset: Offset(
                            0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              height: 50,
                              width: 50,
                              image:
                              AssetImage("images/logo.png"),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "Ethiopian Dance Art association",
                                style:
                                style.copyWith(fontSize: 11),
                              ),
                              Text(
                                "የኢትዮጵያ ተወዛዋዦች ጥበብ ማህበር",
                                style:
                                style.copyWith(fontSize: 10),
                              ),
                              Text(
                                "ስልክ:- +251 911 547577 / +251 911 403456",
                                style:
                                style.copyWith(fontSize: 9),
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
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:


                        CrossAxisAlignment.end,
                        children: [
                          Image(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.15,
                            width: MediaQuery.of(context)
                                .size
                                .width *
                                0.35,
                            image: NetworkImage(
                                imgUrl),
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Name",
                                        style: style.copyWith(
                                            fontWeight:
                                            FontWeight.w500,
                                            fontSize: 10),
                                      ),
                                      Text(
                                        fullName,
                                        style: style.copyWith(
                                            fontSize: 10),
                                      ),
                                      SizedBox()
                                    ],
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Text(
                                          "           ",
                                          style: TextStyle(
                                              fontSize: 10),
                                        ),
                                        Expanded(
                                            child: Divider(
                                              height: 0,
                                              thickness: 3,
                                            )),
                                      ]),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Column(


                                        children: [
                                          Text(
                                            "Occupation",
                                            style: style.copyWith(
                                                fontWeight:
                                                FontWeight
                                                    .w500,
                                                fontSize: 10),
                                          ),
                                        ],

                                      ),


                                      Column(
                                        children: [
                                          Text(
                                            occupation,
                                            style: style.copyWith(
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      SizedBox()
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "           ",
                                        style: TextStyle(
                                            fontSize: 10),
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
                          style: style.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10)),
                      Row(
                        children: [
                          Text(
                            'ID No',
                            style: style.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextField(
                            controller: licenseId,

                            style: TextStyle(
                              fontWeight: FontWeight.bold,


                              fontFamily: "Poppins",
                              decoration:
                              TextDecoration.underline,
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
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                                "email:-  " +
                                    email,
                                style:
                                style.copyWith(fontSize: 10)),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "yetsetebet ken",
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
                                      issueDate
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      issueDate
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "meyabekabet ken",
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
                                      expireDate
                                          .toString()
                                          .substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      expireDate
                                          .toString()
                                          .substring(0, 10),
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
                      SizedBox(height: 50),
                      Center(
                        child: ElevatedButton(onPressed: (){
                          if(licenseId.text.isEmpty)
                          {
                            print('no null');
                          }
                          else
                          {
                            License myLicense = License(fullName: fullName,
                                occupation: occupation,
                                licenseId: licenseId.text,
                                email: email,
                                phone: phone,
                                issueDate: toString(),
                                expiryDate:  expireDate.toString(),
                                imgUrl: imgUrl,
                                uid: uid,

                                status: 'Enabled',
                                address: address,
                                subCity: subCity,
                                woreda: woreda,
                                houseNumber: houseNumber
                            );
                            dbContext.generateLicense(myLicense)
                                .then((value) => {
                              Alert( context: context, type: AlertType.info, desc: 'Successfull').show()
                            })
                                .catchError((onError)=>{
                              Alert( context: context, type: AlertType.info, desc: 'Error formed').show()
                            });
                          }
                        }, child: Text('Certify')),
                      ),
                    ],




                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
