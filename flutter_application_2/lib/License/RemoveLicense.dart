import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:validators/validators.dart';

import '../app_colors.dart';
import 'LicenseConsolePage.dart';

class RemoveLicense extends StatefulWidget {
  @override
  _RemoveLicenseState createState() => _RemoveLicenseState();
}

class _RemoveLicenseState extends State<RemoveLicense> {
  TextEditingController search = TextEditingController();
  TextStyle style = TextStyle(
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
        borderRadius: BorderRadius.circular(30),
      ),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),

              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeNotifierProvider(
                                    create: (context) => DbContext(),
                                    child: LicenseConsolePage())));
                        // Interactivity or events codes here
                      },
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: Color(0xFFEF8242),
                              ),
                            ),
                            hintText: 'Search for Traditional Choreographers',
                            hintStyle: TextStyle(
                              color: Color(0xFFEF8242),
                              fontSize: 17,
                              fontFamily: 'Poppins',
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){
                                if(isEmail(search.text)==false)
                                {
                                  Alert(context: context,
                                      type: AlertType.error,
                                      title: 'Enter valid email address',
                                      desc: 'Please enter a valid email address. ex: member@example.com'
                                  ).show();
                                }
                                else
                                {
                                  dbContext.fetchLicense(search.text.trim());
                                }

                              },
                              icon: Icon(Icons.search,size: 22,) ,

                              color: Color(0xFFEF8242),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //  SizedBox(width: 400,),
                  ],
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: dbContext.fetchLicense(search.text.trim()),
                  //stream: FirebaseFirestore.instance.collection('Admins').snapshots(),
                  builder: (context, snapshot) {
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
                                'could not find License',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              )));
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              QueryDocumentSnapshot<Object?> documentSnapshot =
                                  snapshot.data!.docs[index];
                              return Dismissible(
                                key: Key(index.toString()),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  elevation: 10,
                                  shadowColor: AppColor.orange,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          documentSnapshot['imgUrl']),
                                    ),
                                    title: Row(
                                      children: [
                                        // CircleAvatar(
                                        //   backgroundImage: NetworkImage(documentSnapshot['imgUrl']),
                                        // ),
                                        // SizedBox(width: 25),
                                        Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot['FullName'])
                                              : '',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: AppColor.orange,
                                          ),
                                          textScaleFactor: 1.5,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        showRemoveFunction(
                                          context,
                                          documentSnapshot['FullName'],
                                          documentSnapshot['Occupation'],
                                          documentSnapshot['LicenseId'],
                                          documentSnapshot['Email'],
                                          documentSnapshot['Phone'],
                                          documentSnapshot['IssueDate'],
                                          documentSnapshot['ExpiryDate'],
                                          documentSnapshot['imgUrl'],
                                          documentSnapshot['uid'],
                                          documentSnapshot['Address'],
                                          documentSnapshot['Woreda'],
                                          documentSnapshot['HouseNumber'],
                                          documentSnapshot['Status'],
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        // SizedBox(width: 500),
                                        Text((documentSnapshot != null)
                                            ? (documentSnapshot['Occupation'])
                                            : ''),

                                        SizedBox(
                                          width: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                        ),
                      );
                    } else if (search.text.isEmpty) {
                      return Text('Please enter name of the applicant');
                    } else {
                      return Text('Something went wrong...try again');
                    }
                  }),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
    ;
  }

  showRemoveFunction(
      context,
      String FullName,
      String Occupation,
      String LicenseId,
      String Email,
      String Phone,
      String IssueDate,
      String ExpiryDate,
      String imgUrl,
      String uid,
      String Address,
      String Woreda,
      String HouseNumber,
      String status) {
    return showDialog(
        context: context,
        builder: (context) {
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
                            image: NetworkImage(imgUrl),
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name",
                                        style: style.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      ),
                                      Text(
                                        FullName,
                                        style: style.copyWith(fontSize: 10),
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
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Expanded(
                                            child: Divider(
                                          height: 0,
                                          thickness: 3,
                                        )),
                                      ]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            Occupation,
                                            style: style.copyWith(fontSize: 10),
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
                          style: style.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 10)),
                      Row(
                        children: [
                          Text(
                            'ID No',
                            style: style.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            LicenseId,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.orange,
                              fontFamily: "Poppins",
                              decoration: TextDecoration.underline,
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
                            Text("email:-  " + Email,
                                style: style.copyWith(fontSize: 10)),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "የተሰጠበት ",
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
                                      IssueDate.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      IssueDate.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "የሚያበቃበት ቀን",
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
                                      ExpiryDate.toString().substring(0, 10),
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      ExpiryDate.toString().substring(0, 10),
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
                        child: RaisedButton(
                            color: Color(0xFFEF8242),
                            textColor: Colors.white,
                            onPressed: () {
                              dbContext
                                  .removeLicense(uid)
                                  .then((value) => {
                                        Alert(
                                                context: context,
                                                type: AlertType.success,
                                                desc: 'Successful!')
                                            .show()
                                      })
                                  .catchError((onError) {
                                Alert(
                                        context: context,
                                        type: AlertType.success,
                                        desc: 'Error caused!')
                                    .show();
                              });
                            },
                            child: Text('Remove License')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
