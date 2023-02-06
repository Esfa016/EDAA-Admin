import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/CertifyPage.dart';
import 'package:flutter_application_2/License/GenerateLicense.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import 'MemberConsolePage.dart';

class TraditionalDancers extends StatefulWidget {
  DateTime issueDate = new DateTime.now();
  DateTime expiryDate = DateTime(
      DateTime.now().year + 2, DateTime.now().month, DateTime.now().day);
  String issueString = DateTime.now().toString();
  String expiryString = DateTime(
          DateTime.now().year + 2, DateTime.now().month, DateTime.now().day)
      .toString();
  TextEditingController search = TextEditingController();

  @override
  _TraditionalDancersState createState() => _TraditionalDancersState();
}

class _TraditionalDancersState extends State<TraditionalDancers> {
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
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: widget.search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: Color(0xFFEF8242),
                    ),
                  ),
                  hintText: 'Search for Traditional Dancers',
                  hintStyle: TextStyle(
                    color: Color(0xFFEF8242),
                    fontSize: 17,
                    fontFamily: 'Poppins',
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      dbContext
                          .fetchTraditionalDancers(widget.search.text.trim());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 22,
                    ),
                    color: Color(0xFFEF8242),
                  ),
                ),
              ),
            ),
          ),

          StreamBuilder<QuerySnapshot>(
              stream:
                  dbContext.fetchTraditionalDancers(widget.search.text.trim()),
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
                    'could not find Member',
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
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10,
                              shadowColor: AppColor.orange,
                              // elevation: 5,
                              child: ListTile(
                                onLongPress: (){
                                  showMemeberDialog(documentSnapshot['userImageURL'],
                                      documentSnapshot['fullName'],
                                    documentSnapshot[
                                    'userEmail'],
                                    documentSnapshot[
                                    'userPhoneNumber']);
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      documentSnapshot['userImageURL']),
                                ),
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
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChangeNotifierProvider(
                                                        create: (context) =>
                                                            DbContext(),
                                                        child: CertifyPage(
                                                          uid: documentSnapshot[
                                                              'userID'],
                                                          fullName:
                                                              documentSnapshot[
                                                                  'fullName'],
                                                          occupation:
                                                              documentSnapshot[
                                                                  'artistCategory'],
                                                          email:
                                                              documentSnapshot[
                                                                  'userEmail'],
                                                          phone: documentSnapshot[
                                                              'userPhoneNumber'],
                                                          issueDate: widget
                                                              .issueDate
                                                              .toString(),
                                                          expireDate: widget
                                                              .expiryDate
                                                              .toString(),
                                                          subCity: documentSnapshot[
                                                              'subCityResidence'],
                                                          address:
                                                              documentSnapshot[
                                                                  'cityResidence'],
                                                          woreda: documentSnapshot[
                                                              'woredaResidence'],
                                                          houseNumber:
                                                              documentSnapshot[
                                                                  'houseNumberResidence'],
                                                          imgUrl:
                                                              documentSnapshot[
                                                                  'userImageURL'],
                                                          status: 'enabled',
                                                        ),
                                                      )));
                                        },
                                        icon: Icon(Icons.check,
                                            color: AppColor.orange)),
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
                } else if (widget.search.text.isEmpty) {
                  return Text('Please enter name of the applicant');
                } else {
                  return Text('Something went wrong...try again');
                }
              }),
        ],
      ),
    );
  }

  showMemeberDialog(String imgUrl, String fullName, String phoneNumber, String email)
  {
    return showDialog(context: context,
        builder: (context)
        {
          TextStyle textDecoration = TextStyle(
              fontFamily: "Poppins",
              letterSpacing: 0.5,
              fontSize: 12.7,
              overflow: TextOverflow.ellipsis,
              //decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: AppColor.black);

          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,

                ),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.3,
                child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width *0.4,
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: CircleAvatar(

                                backgroundImage: NetworkImage(imgUrl)),
                          ),
                          SizedBox(height: 10),

                          Text(fullName, style: textDecoration,),
                          SizedBox(height: 2,),
                          Text(phoneNumber,style: textDecoration),
                          SizedBox(height: 2,),
                          Text(email,style: textDecoration),
                        ],
                      ),
                    )
              ),
            ),
          );
        });


  }
}
