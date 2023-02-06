import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/License/DisableLicense.dart';
import 'package:flutter_application_2/License/RenewOption.dart';
import 'package:flutter_application_2/License/RenewOptionPage.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:validators/validators.dart';

import '../app_colors.dart';
import 'DisableLicensePage.dart';

class RenewLicense extends StatefulWidget {
  TextEditingController search = TextEditingController();


  @override
  _RenewLicenseState createState() => _RenewLicenseState();
}

class _RenewLicenseState extends State<RenewLicense> {
  String mValue="";
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Material(
        child: Container(

        decoration: BoxDecoration(
        color: AppColor.white, borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.all(20),
    child: Column(
    children: [

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    // Text(
    //   "Members Details",
    //   style: TextStyle(
    //     fontFamily: 'Poppins',
    //     fontWeight: FontWeight.bold,
    //     color: AppColor.bgColor,
    //     fontSize: 22,
    //   ),
    // ),


    // Container(
    //   height: 200,
    //   width: 200,
    //   decoration: BoxDecoration(
    //       color: AppColor.orange,
    //       borderRadius: BorderRadius.circular(100)),
    //   padding: EdgeInsets.symmetric(
    //     vertical: 10,
    //     horizontal: 20,
    //   ),
    //   /*child: Text(
    //     "View All",
    //     style: TextStyle(
    //       fontFamily: 'Poppins',
    //       fontWeight: FontWeight.bold,
    //       color: AppColor.black,
    //     ),
    //   ),*/
    // ),
    ],

    ),
    // Divider(
    //   thickness: 2,
    //   color: AppColor.orange,
    // ),
    TextField(
    decoration: InputDecoration(
    labelText: 'Search '
    ),
    controller: widget.search,
    ),
    ElevatedButton(
    onPressed: (){
      if(isEmail(widget.search.text)==false)
      {
        Alert(context: context,
            type: AlertType.error,
            title: 'Enter valid email address',
            desc: 'Please enter a valid email address. ex: member@example.com'
        ).show();
      }
      else
      {
        dbContext.fetchLicense(widget.search.text.trim());
      }

    }, child: Text('Search'),
    ),
    StreamBuilder<QuerySnapshot>(

    stream: dbContext.fetchLicense(widget.search.text.trim()),
    //stream: FirebaseFirestore.instance.collection('Admins').snapshots(),
    builder: (context,snapshot)
    {

    if(snapshot.hasError)
    {
    return Text('something went wrong');

    }
    else if(snapshot.hasData || snapshot.data!=null)
    {

    return       ListView.builder(
    shrinkWrap: true,
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (BuildContext context, int index)
    {
    QueryDocumentSnapshot<Object?> documentSnapshot = snapshot.data!.docs[index];
    mValue = documentSnapshot['Status'];
    //mValue=='disabled'? Container(child: Text('Disabled'),)
    return Dismissible(
    key: Key(index.toString()),
    child: Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(documentSnapshot['imgUrl']),),
        title: Text(
        documentSnapshot['FullName'],
          style: TextStyle(
            color: AppColor.orange,
          ),
          textScaleFactor: 1.5,
        ),
        trailing: TextButton(
          child: Text('Enable/Disable'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
              create: (context)=>DbContext(),
              child: DisableLicensePage(
                  FullName: documentSnapshot['FullName'],
                  Occupation: documentSnapshot['Occupation'],
                  LicenseId: documentSnapshot['LicenseId'],
                  Email: documentSnapshot['Email'],
                  Phone: documentSnapshot['Phone'],
                  IssueDate: documentSnapshot['IssueDate'],
                  ExpiryDate: documentSnapshot['ExpiryDate'],
                  imgUrl: documentSnapshot['imgUrl'],
                  uid: documentSnapshot['uid'],
                  Address: documentSnapshot['Address'],
                  Woreda: documentSnapshot['Woreda'],
                  HouseNumber: documentSnapshot['HouseNumber'],
                  status: documentSnapshot['Status']),
            )));
          },
        ),
        subtitle: Text(
         documentSnapshot['Occupation'],
          style: TextStyle(
            color: AppColor.orange,
          ),
        ),
        //selected: true,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
            create: (context)=>DbContext(),
            child: RenewPageOption(
                FullName: documentSnapshot['FullName'],
                Occupation: documentSnapshot['Occupation'],
                LicenseId: documentSnapshot['LicenseId'],
                Email:documentSnapshot['Email'],
                Phone: documentSnapshot['Phone'],
                IssueDate: documentSnapshot['IssueDate'],
                ExpiryDate: documentSnapshot['ExpiryDate'],
                imgUrl: documentSnapshot['imgUrl'],
                uid: documentSnapshot['uid'],
                Address:documentSnapshot['Address'],
                Woreda: documentSnapshot['Woreda'],
                HouseNumber: documentSnapshot['HouseNumber'],
                status: documentSnapshot['Status']),
          )));
        },
      ),
    ),
    );

    }

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
    else if(widget.search.text.isEmpty)
    {
    return Text('Please enter name of the applicant');
    }
    else
    {
    return Text('Something went wrong...try again');
    }
    }


    ),
    Container(
    padding: EdgeInsets.symmetric(
    vertical: 15,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    "Showing 4 out of 4 Results",
    style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    );

  }
}
