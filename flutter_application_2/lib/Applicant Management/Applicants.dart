import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Models/Member.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import '/R/Applicant_Details.dart';

import '../app_colors.dart';
class Applicants extends StatefulWidget {
TextEditingController search = TextEditingController();
  @override
  _ApplicantsState createState() => _ApplicantsState();
}

class _ApplicantsState extends State<Applicants> {
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
                
              ],
              
            ),
           
            TextField(
              decoration: InputDecoration(
                  labelText: 'Search '
              ),
              controller: widget.search,
            ),
            ElevatedButton(
              onPressed: (){
                dbContext.fetchApplicantsByName(widget.search.text.trim());
              }, child: Text('Search'),
            ),
            StreamBuilder<QuerySnapshot>(

                stream: dbContext.fetchApplicantsByName(widget.search.text.trim()),
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
                          return Dismissible(
                            key: Key(index.toString()),
                            child: Card(
                              elevation: 4,
                              child: ListTile(

                                onTap: ()async{
                                  print('new page');
                                  Navigator.push(
                                      context,
                                      await MaterialPageRoute(builder: (context) => accept_form(
                                        userID: documentSnapshot['userID'],
                                        fullName: documentSnapshot['fullName'],
                                        dateOfBirth: documentSnapshot['dateOfBirth'],
                                        userEmail: documentSnapshot['userEmail'],
                                        userPhoneNumber: documentSnapshot['userPhoneNumber'],
                                        //homePhoneNumber: documentSnapshot['homePhoneNumber'],
                                        gender: documentSnapshot['gender'],
                                        nationality: documentSnapshot['nationality'],
                                        martialStatus: documentSnapshot['martialStatus'],
                                        regionBirth: documentSnapshot['regionBirth'],
                                        cityBirth: documentSnapshot['cityBirth'],
                                        woredaBirth: documentSnapshot['woredaBirth'],
                                        kebeleBirth: documentSnapshot['kebeleBirth'],
                                        houseNumberBirth: documentSnapshot['houseNumberBirth'],
                                        subCityBirth: documentSnapshot['subCityBirth'],
                                        regionResidence: documentSnapshot['regionResidence'],
                                        cityResidence: documentSnapshot['cityResidence'],
                                        woredaResidence: documentSnapshot['woredaResidence'],
                                        kebeleResidence: documentSnapshot['kebeleResidence'],
                                        houseNumberResidence: documentSnapshot['houseNumberResidence'],
                                        subCityResidence: documentSnapshot['subCityResidence'],
                                        postalCodeResidence: documentSnapshot['postalCodeResidence'],
                                        nameofInstitution: documentSnapshot ['nameofInstitution'],
                                        jobProffession: documentSnapshot['jobProffession'],
                                        workRegion: documentSnapshot['workRegion'],
                                        workCity: documentSnapshot['workCity'],
                                        workPObox: documentSnapshot['workPObox'],
                                        workSubCity: documentSnapshot['workSubCity'],
                                        workWoreda: documentSnapshot['workWoreda'],
                                        workKebele: documentSnapshot['workKebele'],
                                        workHouseNumber: documentSnapshot['workHouseNumber'],
                                        userImageURL: documentSnapshot['userImageURL'],
                                        //dateofApplication: documentSnapshot['dateofApplication'],


                                      )));
                                },
                                leading: IconButton(
                                  onPressed: (){
                                    Member myMember = Member(
                                        userID: documentSnapshot['userID'],
                                        fullName: documentSnapshot['fullName'],
                                        dateOfBirth: documentSnapshot['dateOfBirth'],
                                        userEmail: documentSnapshot['userEmail'],
                                        userPhoneNumber: documentSnapshot['userPhoneNumber'],
                                        //homePhoneNumber: documentSnapshot['homePhoneNumber'],
                                        gender: documentSnapshot['gender'],
                                        nationality: documentSnapshot['nationality'],
                                        martialStatus: documentSnapshot['martialStatus'],
                                        regionBirth: documentSnapshot['regionBirth'],
                                        cityBirth: documentSnapshot['cityBirth'],
                                        woredaBirth: documentSnapshot['woredaBirth'],
                                        kebeleBirth: documentSnapshot['kebeleBirth'],
                                        houseNumberBirth: documentSnapshot['houseNumberBirth'],
                                        subCityBirth: documentSnapshot['subCityBirth'],
                                        regionResidence: documentSnapshot['regionResidence'],
                                        cityResidence: documentSnapshot['cityResidence'],
                                        woredaResidence: documentSnapshot['woredaResidence'],
                                        kebeleResidence: documentSnapshot['kebeleResidence'],
                                        houseNumberResidence: documentSnapshot['houseNumberResidence'],
                                        subCityResidence: documentSnapshot['subCityResidence'],
                                        postalCodeResidence: documentSnapshot['postalCodeResidence'],
                                        nameofInstitution: documentSnapshot ['nameofInstitution'],
                                        jobProffession: documentSnapshot['jobProffession'],
                                        workRegion: documentSnapshot['workRegion'],
                                        workCity: documentSnapshot['workCity'],
                                        workPObox: documentSnapshot['workPObox'],
                                        workSubCity: documentSnapshot['workSubCity'],
                                        workWoreda: documentSnapshot['workWoreda'],
                                        workKebele: documentSnapshot['workKebele'],
                                        workHouseNumber: documentSnapshot['workHouseNumber'],
                                        userImageURL: documentSnapshot['userImageURL'],

                                        artistCategory: documentSnapshot['artistCategory'],
                                        cvURL: documentSnapshot['cvURL'],
                                        youtubeLink: documentSnapshot['youtubeLink']);
                                    //DbContext dbContext = DbContext();
                                    dbContext.registerMember(myMember)
                                        .then((value) => print('Success'))
                                        .catchError((onError)=>print('$onError'));

                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(documentSnapshot['userImageURL']),
                                    ),
                                    SizedBox(width: 25),
                                    Text((documentSnapshot!= null) ? (documentSnapshot['fullName']):''),
                                  ],
                                ),
                                subtitle: Text((documentSnapshot!= null) ? (documentSnapshot['artistCategory']):''),
                                trailing: IconButton(
                                  onPressed: (){
                                    print(documentSnapshot['userID'].toString());
                                  },
                                  icon: Icon(
                                    Icons.block,
                                    color: Colors.red,

                                  ),
                                ),
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

TableRow tableRow(context,
    { name, id, category, gender, email, icons}) {
  return TableRow(

    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
    ),
    children: [
      /// Full Name
      Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          children: [
            /*Hero(
                tag: "picture",
                child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("images/profilepic.png"),
                            fit: BoxFit.cover)))),*/
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                child: Text(name),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ()));
                }),
          ],
        ),
      ),

      /// ID
      Container(

        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(id)
          ],
        ),
      ),

      /// Category
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(category)
          ],
        ),
      ),

      /// Age
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            //Text(age)
          ],
        ),
      ),

      /// Gender
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(gender)
          ],
        ),
      ),

      /// Email
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(email)
          ],
        ),
      ),

      /// delete
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              height: 10,
            ),
            Icon(icons)
          ],
        ),
      ),
    ],
  );
}

Widget tableHeader(text) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
    ),

  );
}

