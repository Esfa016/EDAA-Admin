import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/Models/Member.dart';
import '/R/Applicant_Details.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app_colors.dart';
import 'AppliManag_page.dart';

class ModernDancerApplicant extends StatefulWidget {
  TextEditingController search = TextEditingController();

  @override
  _ModernDancerApplicantState createState() => _ModernDancerApplicantState();
}

class _ModernDancerApplicantState extends State<ModernDancerApplicant> {
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
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeNotifierProvider(
                                  create: (context) => DbContext(),
                                  child: ApplicantManagementPage())));
                      // Interactivity or events codes here
                    },
                  ),
                ],
              ),
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
                      hintText: 'Search for modern dancers',
                      hintStyle: TextStyle(
                        color: Color(0xFFEF8242),
                        fontSize: 17,
                        fontFamily: 'Poppins',
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          dbContext.fetchModernDancerApplicants(
                              widget.search.text.trim());
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
                  stream: dbContext
                      .fetchModernDancerApplicants(widget.search.text.trim()),
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
                        'could not find applicant',
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
                                    onTap: () async {
                                      print('new page');
                                      // Navigator.push(
                                      //     context,
                                      //     await MaterialPageRoute(builder: (context) => accept_form(
                                      //       userID: documentSnapshot['userID'],
                                      //       fullName: documentSnapshot['fullName'],
                                      //       dateOfBirth: documentSnapshot['dateOfBirth'],
                                      //       userEmail: documentSnapshot['userEmail'],
                                      //       userPhoneNumber: documentSnapshot['userPhoneNumber'],
                                      //       //homePhoneNumber: documentSnapshot['homePhoneNumber'],
                                      //       gender: documentSnapshot['gender'],
                                      //       nationality: documentSnapshot['nationality'],
                                      //       martialStatus: documentSnapshot['martialStatus'],
                                      //       regionBirth: documentSnapshot['regionBirth'],
                                      //       cityBirth: documentSnapshot['cityBirth'],
                                      //       woredaBirth: documentSnapshot['woredaBirth'],
                                      //       kebeleBirth: documentSnapshot['kebeleBirth'],
                                      //       houseNumberBirth: documentSnapshot['houseNumberBirth'],
                                      //       subCityBirth: documentSnapshot['subCityBirth'],
                                      //       regionResidence: documentSnapshot['regionResidence'],
                                      //       cityResidence: documentSnapshot['cityResidence'],
                                      //       woredaResidence: documentSnapshot['woredaResidence'],
                                      //       kebeleResidence: documentSnapshot['kebeleResidence'],
                                      //       houseNumberResidence: documentSnapshot['houseNumberResidence'],
                                      //       subCityResidence: documentSnapshot['subCityResidence'],
                                      //       postalCodeResidence: documentSnapshot['postalCodeResidence'],
                                      //       nameofInstitution: documentSnapshot ['nameofInstitution'],
                                      //       jobProffession: documentSnapshot['jobProffession'],
                                      //       workRegion: documentSnapshot['workRegion'],
                                      //       workCity: documentSnapshot['workCity'],
                                      //       workPObox: documentSnapshot['workPObox'],
                                      //       workSubCity: documentSnapshot['workSubCity'],
                                      //       workWoreda: documentSnapshot['workWoreda'],
                                      //       workKebele: documentSnapshot['workKebele'],
                                      //       workHouseNumber: documentSnapshot['workHouseNumber'],
                                      //       userImageURL: documentSnapshot['userImageURL'],
                                      //       //dateofApplication: documentSnapshot['dateofApplication'],
                                      //
                                      //
                                      //     )));

                                      showDialogFunction(
                                          context,
                                          documentSnapshot['userID'],
                                          documentSnapshot['fullName'],
                                          documentSnapshot['dateOfBirth'],
                                          documentSnapshot['userEmail'],
                                          documentSnapshot['userPhoneNumber'],
                                          documentSnapshot['gender'],
                                          documentSnapshot['nationality'],
                                          documentSnapshot['martialStatus'],
                                          documentSnapshot['regionBirth'],
                                          documentSnapshot['cityBirth'],
                                          documentSnapshot['woredaBirth'],
                                          documentSnapshot['kebeleBirth'],
                                          documentSnapshot['houseNumberBirth'],
                                          documentSnapshot['subCityBirth'],
                                          documentSnapshot['regionResidence'],
                                          documentSnapshot['cityResidence'],
                                          documentSnapshot['woredaResidence'],
                                          documentSnapshot['kebeleResidence'],
                                          documentSnapshot[
                                              'houseNumberResidence'],
                                          documentSnapshot['subCityResidence'],
                                          documentSnapshot[
                                              'postalCodeResidence'],
                                          documentSnapshot['nameofInstitution'],
                                          documentSnapshot['jobProffession'],
                                          documentSnapshot['workRegion'],
                                          documentSnapshot['workCity'],
                                          documentSnapshot['workPObox'],
                                          documentSnapshot['workSubCity'],
                                          documentSnapshot['workWoreda'],
                                          documentSnapshot['workKebele'],
                                          documentSnapshot['workHouseNumber'],
                                          documentSnapshot['userImageURL'],
                                          documentSnapshot['artistCategory'],
                                          documentSnapshot['cvURL'],
                                          documentSnapshot['youtubeLink']);
                                    },
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              documentSnapshot['userImageURL']),
                                        ),
                                        SizedBox(width: 25),
                                        Text(
                                          (documentSnapshot != null)
                                              ? (documentSnapshot['fullName'])
                                              : '',
                                          style: TextStyle(
                                            color: AppColor.orange,
                                          ),
                                          textScaleFactor: 1.5,
                                        ),
                                       // SizedBox(width: 25),
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [

                                        IconButton(
                                          onPressed: () {
                                            Member myMember = Member(
                                                userID:
                                                    documentSnapshot['userID'],
                                                fullName: documentSnapshot[
                                                    'fullName'],
                                                dateOfBirth: documentSnapshot[
                                                    'dateOfBirth'],
                                                userEmail: documentSnapshot[
                                                    'userEmail'],
                                                userPhoneNumber: documentSnapshot[
                                                    'userPhoneNumber'],
                                                //homePhoneNumber: documentSnapshot['homePhoneNumber'],
                                                gender:
                                                    documentSnapshot['gender'],
                                                nationality: documentSnapshot[
                                                    'nationality'],
                                                martialStatus: documentSnapshot[
                                                    'martialStatus'],
                                                regionBirth: documentSnapshot[
                                                    'regionBirth'],
                                                cityBirth: documentSnapshot[
                                                    'cityBirth'],
                                                woredaBirth: documentSnapshot[
                                                    'woredaBirth'],
                                                kebeleBirth: documentSnapshot[
                                                    'kebeleBirth'],
                                                houseNumberBirth:
                                                    documentSnapshot[
                                                        'houseNumberBirth'],
                                                subCityBirth: documentSnapshot[
                                                    'subCityBirth'],
                                                regionResidence: documentSnapshot[
                                                    'regionResidence'],
                                                cityResidence: documentSnapshot[
                                                    'cityResidence'],
                                                woredaResidence:
                                                    documentSnapshot[
                                                        'woredaResidence'],
                                                kebeleResidence:
                                                    documentSnapshot[
                                                        'kebeleResidence'],
                                                houseNumberResidence:
                                                    documentSnapshot[
                                                        'houseNumberResidence'],
                                                subCityResidence:
                                                    documentSnapshot[
                                                        'subCityResidence'],
                                                postalCodeResidence:
                                                    documentSnapshot[
                                                        'postalCodeResidence'],
                                                nameofInstitution:
                                                    documentSnapshot[
                                                        'nameofInstitution'],
                                                jobProffession: documentSnapshot[
                                                    'jobProffession'],
                                                workRegion:
                                                    documentSnapshot['workRegion'],
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
                                            dbContext
                                                .registerMember(myMember)
                                                .then(
                                                    (value) => print('Success'))
                                                .catchError((onError) =>
                                                    print('$onError'));
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            dbContext
                                                .declineApplicant(
                                                    documentSnapshot['userID'])
                                                .then((value) => {
                                                      dbContext.delApplicants(
                                                        documentSnapshot[
                                                            'userID'],
                                                        documentSnapshot[
                                                            'artistCategory'],
                                                      )
                                                    });
                                          },
                                          icon: Icon(
                                            Icons.block,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Something went wrong. please try again',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('Something went wrong...try again');
                    }
                  }),

            ],
          ),
        ),
      ),
    );
  }

  showDialogFunction(
    context,
    String userID,
    String fullName,
    String dateOfBirth,
    String userEmail,
    String userPhoneNumber,
    // String homePhoneNumber;
    String gender,
    String nationality,
    String martialStatus,
    String regionBirth,
    String cityBirth,
    String woredaBirth,
    String kebeleBirth,
    String houseNumberBirth,
    String subCityBirth,
    String regionResidence,
    String cityResidence,
    String woredaResidence,
    String kebeleResidence,
    String houseNumberResidence,
    String subCityResidence,
    String postalCodeResidence,
    String nameofInstitution,
    String jobProffession,
    String workRegion,
    String workCity,
    String workPObox,
    String workSubCity,
    String workWoreda,
    String workKebele,
    String workHouseNumber,
    String userImageURL,
    String artistCategory,
    String cvURL,
    String youtubeLink,
  ) {
    return showDialog(context: context,
        builder: (context) {
          var brightness = MediaQuery.of(context).platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;

          TextStyle textDecoration = TextStyle(
              fontFamily: "Poppins",
              letterSpacing: 0.5,
              fontSize: 12.7,
              overflow: TextOverflow.ellipsis,
              //decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: AppColor.orange);

          BoxDecoration boxDecoration = BoxDecoration(
            //color: Theme.of(context).primaryColor.withOpacity(0.05),
            color: isDarkMode ? Colors.black.withOpacity(0.3) : Colors.white,
            boxShadow: [
              isDarkMode
                  ? BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 0,
                offset: Offset(0, 0), // changes position of shadow
              )
                  : BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          );
          return Center(
            child: Material(
              child: Container(

                width: MediaQuery.of(context).size.width * 0.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    color: AppColor.bgColor,
                    child: Column(
                      children: [
                        Container(

                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                          decoration: boxDecoration,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(userImageURL),
                                ),
                              ),
                              SizedBox(width: 10,),




                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ' + fullName, style: textDecoration.copyWith(
                                        color: Colors.black
                                    )),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text('Phone: ' + userPhoneNumber, style: textDecoration),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Text("31 years old" , style: textDecoration),
                                    //     Text(
                                    //       "    ( " + "10/12/1990" + " )",
                                    //       style: TextStyle(
                                    //           fontSize: 12,
                                    //           fontWeight: FontWeight.bold,
                                    //           fontFamily: "Poppins",
                                    //           color: Theme.of(context)
                                    //               .primaryColor
                                    //               .withOpacity(0.7)),
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text('Email '+userEmail, style: textDecoration),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text('Gender '+gender, style: textDecoration),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(

                          decoration: boxDecoration,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Place of Birth",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("City: " + cityBirth , style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Sub-City: " + subCityBirth, style: textDecoration),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Region: " + regionBirth, style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Woreda   " + "no: "  + woredaBirth, style: textDecoration),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(

                          decoration: boxDecoration,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Place of Residence",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color:Colors.black),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("City: " + cityResidence, style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Sub-City: " + subCityResidence, style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Kebele    " + "number: " + kebeleResidence,
                                            style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("House no    " + "number: " + houseNumberResidence,
                                            style: textDecoration),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Region: "  + regionResidence, style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Woreda   " + "no: " +woredaResidence, style: textDecoration),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text("Postal Code   " + "no: " +  postalCodeResidence,
                                            style: textDecoration),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(

                          decoration: boxDecoration,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: Text(
                                    "Place of Work",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name of Institution: " + nameofInstitution,
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        letterSpacing: 0.8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Job Profession: " + jobProffession,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          letterSpacing: 0.8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),
                                    ),
                                    // Text("Soccer player" , style: textDecoration),
                                    // SizedBox(
                                    //   height: 8,
                                    // ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("City: " + workCity, style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Sub-City: " + workSubCity, style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Kebele    " + "nmbr: " + workKebele,
                                                style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("House no    " + "nmbr: " + workHouseNumber,
                                                style: textDecoration),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Region: "+ workRegion, style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Woreda   " + "no: " +workWoreda,
                                                style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Postal Code   " + "no" + workPObox ,
                                                style: textDecoration),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text("Tel: " , style: textDecoration),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: boxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(child: Text('show youtube', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                ),
                                ),
                                  onTap: (){launch(youtubeLink);},
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(2),
                                decoration: boxDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: InkWell(child: Text('show Cv', style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                )
                                  ,
                                ),
                                  onTap: (){
                                    launch(cvURL);
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),

                        // Container(
                        //   margin: EdgeInsets.all(15),
                        //               //   padding: EdgeInsets.all(10),
                        //               //   child: Column(
                        //               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //               //     children: [
                        //               //       RaisedButton(
                        //               //
                        //               //   shape: RoundedRectangleBorder(
                        //               //   borderRadius: BorderRadius.circular(18.0),
                        //               //     side: BorderSide(color: Color(0xFFEF8242))),
                        //               //         onPressed: (){
                        //               //       }, child: InkWell(
                        //               //
                        //               //       onTap: (){launch(cvURL);},
                        //               //       child: Text('Show Cv',style: TextStyle(
                        //               //           fontFamily: 'Poppins'))
                        //               //
                        //               //
                        //               //     ),
                        //               //
                        //               //       ),
                        //               //       SizedBox(height: 5,),
                        //               //       RaisedButton(
                        //               //
                        //               //         shape: RoundedRectangleBorder(
                        //               //             borderRadius: BorderRadius.circular(18.0),
                        //               //             side: BorderSide(color: Color(0xFFEF8242))),
                        //               //         onPressed: (){
                        //               //         }, child: InkWell(
                        //               //
                        //               //           onTap: (){launch(youtubeLink);},
                        //               //           child: Text('Show Youtube Video',style: TextStyle(
                        //               //               fontFamily: 'Poppins'))
                        //               //
                        //               //
                        //               //       ),
                        // )
                      ],
                    ),
                  ),
                ),
                // backgroundColor: AppColor.bgSideMenu,
                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     /// Side Navigation Menu
                //     // Expanded(
                //     //   child: ChangeNotifierProvider(
                //     //     create: (context)=>DbContext(),
                //     //       child: SideBar()),
                //     // ),
                //     //
                //     // /// Main Body Part
                //     // Expanded(
                //     //   flex: 5,
                //     //   child: ChangeNotifierProvider(
                //     //     create: (context)=>DbContext(),
                //     //       child: MemberConsolePage()),
                //     // ),
                //
                //     Container(
                //       //width: 300,
                //       margin: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //         color: AppColor.white,
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       //padding: EdgeInsets.all(20),
                //       child: SingleChildScrollView(
                //         child: Column(
                //           children: [
                //             Row(
                //               children: [
                //                 Hero(
                //                   tag: "picture",
                //                   child: Container(
                //                       height: 100,
                //                       width: 100,
                //
                //                       child: CircleAvatar(
                //                         backgroundImage: NetworkImage(userImageURL) ,
                //                       )
                //                   ),
                //                 ),
                //
                //               ],
                //             ), SizedBox(width: 3,),
                //             // Column(
                //             //   children: [
                //             //     Row(
                //             //
                //             //       children: [
                //             //         Text('Name'),
                //             //         SizedBox(width: 10),
                //             //         Text(fullName),
                //             //       ],
                //             //     ),
                //             //     Text(userPhoneNumber),
                //             //     Text(userEmail,),
                //             //     Text(gender)
                //             //   ],
                //             // ),
                //             // Card(
                //             //   child: Container(
                //             //     margin: EdgeInsets.only(top: 15),
                //             //     child: Column(
                //             //       crossAxisAlignment: CrossAxisAlignment.start,
                //             //       children: [
                //             //         Text("Place of Birth",
                //             //             style: TextStyle(
                //             //                 fontFamily: "Poppins",
                //             //                 fontWeight: FontWeight.bold,
                //             //                 color: AppColor.orange)),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 regionBirth),
                //             //             Text(
                //             //               cityBirth, ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //               woredaBirth,),
                //             //             Text(
                //             //                 kebeleBirth ),
                //             //             Text(
                //             //                 houseNumberBirth ),
                //             //           ],
                //             //         ),
                //             //         Text(
                //             //             subCityBirth),
                //             //       ],
                //             //     ),
                //             //   ),
                //             // ),
                //             // Card(
                //             //   child: Container(
                //             //     margin: EdgeInsets.only(top: 15),
                //             //     child: Column(
                //             //       crossAxisAlignment: CrossAxisAlignment.start,
                //             //       children: [
                //             //         Text("Place of Residence",
                //             //             style: TextStyle(
                //             //                 fontFamily: "Poppins",
                //             //                 fontWeight: FontWeight.bold,
                //             //                 color: AppColor.orange)),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 regionResidence ),
                //             //             Text(
                //             //                 cityResidence ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 woredaResidence ),
                //             //             Text(
                //             //                 kebeleResidence ),
                //             //             Text(
                //             //                 houseNumberResidence ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 postalCodeResidence ),
                //             //             Text(
                //             //                 subCityResidence ),
                //             //           ],
                //             //         ),
                //             //       ],
                //             //     ),
                //             //   ),
                //             // ),
                //             // Card(
                //             //   child: Container(
                //             //     margin: EdgeInsets.only(top: 15),
                //             //     child: Column(
                //             //       crossAxisAlignment: CrossAxisAlignment.start,
                //             //       children: [
                //             //         Text("Place of Work",
                //             //             style: TextStyle(
                //             //                 fontFamily: "Poppins",
                //             //                 fontWeight: FontWeight.bold,
                //             //                 color: AppColor.orange)),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //               nameofInstitution,
                //             //             ),
                //             //             Text(
                //             //               jobProffession,
                //             //             ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 workRegion ),
                //             //             Text(
                //             //                 workCity ),
                //             //             Text(
                //             //                 workPObox ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 workWoreda),
                //             //             Text(
                //             //                 workKebele ),
                //             //             Text(
                //             //                 workHouseNumber ),
                //             //           ],
                //             //         ),
                //             //         Row(
                //             //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //           children: [
                //             //             Text(
                //             //                 workHouseNumber),
                //             //             Text(
                //             //               workSubCity,)
                //             //           ],
                //             //         ),
                //             //       ],
                //             //     ),
                //             //   ),
                //             // ),
                //             // Container(
                //             //
                //             //   margin: EdgeInsets.all(15),
                //             //   padding: EdgeInsets.all(10),
                //             //   child: Column(
                //             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             //     children: [
                //             //       RaisedButton(
                //             //
                //             //   shape: RoundedRectangleBorder(
                //             //   borderRadius: BorderRadius.circular(18.0),
                //             //     side: BorderSide(color: Color(0xFFEF8242))),
                //             //         onPressed: (){
                //             //       }, child: InkWell(
                //             //
                //             //       onTap: (){launch(cvURL);},
                //             //       child: Text('Show Cv',style: TextStyle(
                //             //           fontFamily: 'Poppins'))
                //             //
                //             //
                //             //     ),
                //             //
                //             //       ),
                //             //       SizedBox(height: 5,),
                //             //       RaisedButton(
                //             //
                //             //         shape: RoundedRectangleBorder(
                //             //             borderRadius: BorderRadius.circular(18.0),
                //             //             side: BorderSide(color: Color(0xFFEF8242))),
                //             //         onPressed: (){
                //             //         }, child: InkWell(
                //             //
                //             //           onTap: (){launch(youtubeLink);},
                //             //           child: Text('Show Youtube Video',style: TextStyle(
                //             //               fontFamily: 'Poppins'))
                //             //
                //             //
                //             //       ),
                //             //
                //             //       ),
                //             //
                //             //
                //             //       //
                //             //       // Container(
                //             //       //
                //             //       //   child: InkWell(
                //             //       //
                //             //       //     onTap: (){launch(cvURL);},
                //             //       //     child: Text('show CV')
                //             //       //
                //             //       //
                //             //       //   ),
                //             //       //   decoration: BoxDecoration(
                //             //       //     border: Border.all(color:Colors.orange)
                //             //       //   ),
                //             //       // ),
                //             //
                //             //
                //             //       // FileUploadButton()
                //             //       // DropDown(
                //             //       //   items: ["Video", "Youtube link", "Pdf"],
                //             //       //   hint: Text("Type of file"),
                //             //       //   icon: Icon(
                //             //       //     Icons.expand_more,
                //             //       //     color: Colors.blue,
                //             //       //   ),
                //             //       //   onChanged: print,
                //             //       // ),
                //             //     ],
                //             //   ),
                //             // ),
                //             // Row(
                //             //   mainAxisAlignment: MainAxisAlignment.start,
                //             //   children: [
                //             //     // Checkbox(
                //             //     //     checkColor: Colors.greenAccent,
                //             //     //     activeColor: Colors.red,
                //             //     //     value: false,
                //             //     //     onChanged: checkBoxCallBack),
                //             //     Checkbox(
                //             //       value: isChecked,
                //             //       onChanged: (value) {
                //             //         setState(() {
                //             //           isChecked = value!;
                //             //           print(isChecked);
                //             //         });
                //             //       },
                //             //     ),
                //             //     Text(
                //             //       "I've agreed to the ",
                //             //       style: TextStyle(
                //             //         fontFamily: "Poppins",
                //             //         fontSize: 11,
                //             //       ),
                //             //     ),
                //             //     GestureDetector(
                //             //       onTap: () => setState(() {
                //             //         //   _launched = _launchInWebViewOrVC(
                //             //         //       "https://www.facebook.com/pg/የኢትዮጵያ-ተወዛዋዦች-ጥበብ-ማሕበር-Ethiopian-Dance-Art-Association-445934009270053/photos/");
                //             //       }),
                //             //       child: Text(
                //             //         "Terms and conditions ",
                //             //         style: TextStyle(
                //             //             color: Colors.blue, fontFamily: "Poppins"),
                //             //       ),
                //             //     ),
                //             //   ],
                //             // ),
                //             // GestureDetector(
                //             //   // onTap: () {
                //             //   //   if (isChecked == true) {
                //             //   //     print("can update");
                //             //   //   } else {
                //             //   //     print("cant");
                //             //   //   }
                //             //   // },
                //             //   child: Container(
                //             //     decoration: BoxDecoration(
                //             //       boxShadow: [
                //             //         BoxShadow(blurRadius: 0.4, color: Colors.white)
                //             //       ],
                //             //       borderRadius: BorderRadius.circular(20),
                //             //       color: isChecked == true
                //             //           ? Color(0xFFEF8242)
                //             //           : Color(0xFFEF8242),
                //             //     ),
                //             //     width: 100,
                //             //     padding: EdgeInsets.symmetric(vertical: 5),
                //             //     child: Center(
                //             //       child: Text(
                //             //         "Update",
                //             //         style: TextStyle(
                //             //           fontFamily: "Poppins",
                //             //           fontSize: 17,
                //             //           fontWeight: FontWeight.bold,
                //             //         ),
                //             //       ),
                //             //     ),
                //             //   ),
                //             // ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          );


        }
    );
  }
}
