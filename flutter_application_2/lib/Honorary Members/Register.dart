import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Controllers%20and%20other%20stuff/Cont.dart';
import 'package:flutter_application_2/Honorary%20Members/HonoraryMemberConsole.dart';
import 'package:flutter_application_2/Models/HonoraryModel.dart';
import 'package:flutter_application_2/R/reusables.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:flutter_application_2/app_colors.dart';
import 'package:flutter_application_2/side_bar_menu.dart';
import 'package:group_button/group_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:enhanced_drop_down/enhanced_drop_down.dart';
import 'package:validators/validators.dart';

import 'HonoraryMember.dart';
class RegisterHononrary extends StatefulWidget {
  @override
  _RegisterHononraryState createState() => _RegisterHononraryState();
}

class _RegisterHononraryState extends State<RegisterHononrary> {

  bool isValid()
  {
    if(!isNumeric(workWoredaController.text) || !isNumeric(workKebeleController.text) || !isEmail(emailController.text) || !isNumeric(workHouseController.text) || !isNumeric(yearsWorkedController.text))

      {
        return false;
      }

    return true;
  }

  bool isChecked = false;
  String phoneNumber='';
  String gender='';
  String nationality='';
  String occupation='';
  String imgUrl='https://firebasestorage.googleapis.com/v0/b/edda-53458.appspot.com/o/Custom%2Fplaceholder-image.png?alt=media&token=8e658992-8c0f-453e-967c-86901033911a';
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    return Scaffold(
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 600),
            child: IconButton(

              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context)=>DbContext(),
                            child: HonoraryMember())));
                // Interactivity or events codes here
              },
            ),
          ),

      Container(

      margin: EdgeInsets.only(left: 350, top: 30),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Hero(
                    tag: "picture",
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imgUrl),
                              fit: BoxFit.cover)),
                      child: GestureDetector(
                        onTap: () {






                          FileUploadInputElement input = FileUploadInputElement()..accept="image/*";
                          input.click();
                          input.onChange.listen((event) {

                            final file = input.files?.first;
                            String fileName = file!.name;
                            final reader = FileReader();
                            reader.readAsDataUrl(file!);
                            reader.onLoadEnd.listen((event)async {
                              // FirebaseStorage.instance.ref().child('News/$mDate')
                              //     .putBlob(file).then((p0) => print('success'))
                              //     .catchError((onError)=>print('$onError'));
                              //TaskSnapshot snapshot = await dbContext.uploadNewsImage(file);
                              // widget.imgPath = dbContext.uploadNewsImage(file);
                              UploadTask mTask = FirebaseStorage.instance.ref().child('News/$fileName') .putBlob(file);
                              TaskSnapshot snapshot = await mTask;
                              snapshot.ref.getDownloadURL().then((value) =>  setState(() {
                                imgUrl = value;
                              }));

                            });

                          });

                        },
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                child: Column(
                  children: [
                    TextFieldWithLessNumber(
                      mController: fullNameController,
                      Name: "Full Name",
                      short: false,
                      hint: "",
                    ),
                    Container(
                      width: 200,
                      child: IntlPhoneField(
                        showCountryFlag: true,
                        readOnly: false,
                        style: TextStyle(fontSize: 13),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                              fontSize: 13,
                              // grep command is for retreiving some content based on some pattern.
                              fontFamily: "Poppins",
                              color: AppColor.bgSideMenu),
                        ),
                        onChanged: (phone) {
                          phoneNumber = phone.toString();
                          //print(phone.completeNumber);
                        },
                        onCountryChanged: (phone) {
                          //print('Country code changed to: ' + phone.countryCode);
                        },
                      ),
                    ),
                    //             widget.dropdownDatePicker,
                    TextFieldWithLessNumber(
                      mController: emailController,
                        Name: "Email",
                        short: false,
                        hint: "com@exaple.com"),

                    GroupButton(
                      direction: Axis.horizontal,
                      borderRadius: BorderRadius.circular(5),
                      isRadio: true,
                      spacing: 8,
                      unselectedColor: Colors.white,
                      unselectedBorderColor: Colors.white,
                      unselectedTextStyle: TextStyle(
                          fontSize: 13,
                          color: AppColor.bgSideMenu,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                      selectedTextStyle: TextStyle(
                          color: AppColor.bgSideMenu,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                      selectedColor: AppColor.orange,
                      onSelected: (index, isSelected) =>
                      {
                        if(index.toString() == '0')
                          {
                            gender = 'Male'
                          }
                        else
                          {
                            gender = 'Female'
                          }
                      },




                      buttons: [
                        "Male",
                        "Female",
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address Details",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: AppColor.orange)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWithLessNumber(
                          mController: workRegionController,
                            Name: "Region", hint: "", short: false),
                        TextFieldWithLessNumber(
                          mController: workCityController,
                            Name: "City", hint: "", short: false),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWithLessNumber(
                          mController: workWoredaController,
                            Name: "Woreda", hint: "", short: true),
                        TextFieldWithLessNumber(
                          mController: workKebeleController,
                            Name: "Kebele", hint: "", short: true),
                        TextFieldWithLessNumber(
                           mController: workSubCityController,
                            Name: "Subcity", hint: "", short: true),
                      ],
                    ),
                    TextFieldWithLessNumber(
                      mController:  workHouseController,
                        Name: "House No.", hint: "", short: false),
                    TextFieldWithLessNumber(
                        mController: yearsWorkedController,
                        Name: "Years of Work", short: false, hint: ""),
                     SizedBox(height: 10,),

                     Center(
                       child: EnhancedDropDown.withData(
                           dropdownLabelTitle:
                       'Artist Category',
                           dataSource: ["Tradtional Dancer", "Modern Dancer", "Traditoinal Chereographer", "Modern Chereographer"],
                           defaultOptionText: 'Select your category'

                           , valueReturned: (chosen)
                       {

                         occupation = chosen;
                       }
                       ),
                     ),



                    SizedBox(

                      height: 30,
                    ),


                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),
             
              GestureDetector(
                onTap: () {
                  if(fullNameController.text.isEmpty || occupation.isEmpty || emailController.text.isEmpty ||
                  phoneNumber.isEmpty || gender.isEmpty || imgUrl.isEmpty || workWoredaController.text.isEmpty
                  || workSubCityController.text.isEmpty || workKebeleController.text.isEmpty || workCityController.text.isEmpty
                  ||workRegionController.text.isEmpty || yearsWorkedController.text.isEmpty || workHouseController.text.isEmpty
                  )
                    {
                      Alert(context: context,type: AlertType.error,title: 'Error registering honorary member',desc: 'please fill all the fields').show();
                    }
                  else
                    {
                      if(isValid())
                        {
                          HonoraryMemberModel myHonoraryMember = HonoraryMemberModel(
                            fullName: fullNameController.text.trim(),
                            occupation: occupation,
                            email: emailController.text.trim(),
                            phone: phoneNumber,
                            gender: gender,
                            imgUrl: imgUrl,
                            woreda: workWoredaController.text.trim(),
                            subCity:  workSubCityController.text.trim(),
                            kebele:  workKebeleController.text.trim(),
                            city: workCityController.text.trim(),
                            region: workRegionController.text.trim(),
                            yearsWorked: yearsWorkedController.text.trim(),
                            houseNumber: workHouseController.text.trim(),

                          );
                          dbContext.registerHonoraryMemeber(myHonoraryMember)
                              .then((value) => {
                            Alert(context: context,
                                title: 'Successful',
                                type: AlertType.success,
                                desc: 'Successfully registered honorary member').show().then((value) => {Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                create:(context)=>DbContext(),
                                child: HonoraryMember()))),})

                          });
                        }
                      else
                        {
                          Alert(context: context, title: 'Invalid input', desc: 'Please enter a valid data',type: AlertType.error).show();
                        }

                    }


                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),color: AppColor.orange

                  ),
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    ],
    ),
        ),
    );


  }
}
