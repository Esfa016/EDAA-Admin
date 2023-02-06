import 'package:flutter/material.dart';
import '/Member%20Management/MemberConsolePage.dart';
import '/Services/AuthServiceAdmin.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class NewAdminProfile extends StatefulWidget {
  @override
  _NewAdminProfileState createState() => _NewAdminProfileState();
}

class _NewAdminProfileState extends State<NewAdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side Navigation Menu
            // Expanded(
            //   child: ChangeNotifierProvider(
            //     create: (context)=>DbContext(),
            //       child: SideBar()),
            // ),
            //
            // /// Main Body Part
            // Expanded(
            //   flex: 5,
            //   child: ChangeNotifierProvider(
            //     create: (context)=>DbContext(),
            //       child: MemberConsolePage()),
            // ),

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Hero(
                          tag: "picture",
                          child: Container(
                            height: 100,
                            width: 100,
                            // decoration: BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     image: DecorationImage(
                            //         image: AssetImage("images/profilepic.png"),
                            //         fit: BoxFit.cover)),
                            // child: GestureDetector(
                            //   onTap: () {},
                            // ),
                           child: CircleAvatar(
                              backgroundImage: NetworkImage('') ,
                            )
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images.logo.png'),
                              ),
                            ),
                          ),
                          onTap: () {
                            // c.launch(context);
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                           "Full Name",

                        ),
                        Container(
                          width: 200,
                          // child: IntlPhoneField(
                          //   showCountryFlag: true,
                          //   readOnly: false,
                          //   style: TextStyle(fontSize: 13),
                          //   decoration: InputDecoration(
                          //     labelText: 'Phone Number',
                          //     labelStyle: TextStyle(
                          //         fontSize: 13,
                          //         fontFamily: "Poppins",
                          //         color: AppColor.bgSideMenu),
                          //   ),
                          //   onChanged: (phone) {
                          //     //print(phone.completeNumber);
                          //   },
                          //   onCountryChanged: (phone) {
                          //     //print('Country code changed to: ' + phone.countryCode);
                          //   },
                          // ),
                         child: Text('Phone')
                        ),
                        //             widget.dropdownDatePicker,
                        Text(
                          "Email",

                          ),
                      Text('Gender')
                      //   GroupButton(
                      //     direction: Axis.horizontal,
                      //     borderRadius: BorderRadius.circular(5),
                      //     isRadio: true,
                      //     spacing: 8,
                      //     unselectedColor: Colors.white,
                      //     unselectedBorderColor: Colors.white,
                      //     unselectedTextStyle: TextStyle(
                      //         fontSize: 13,
                      //         color: AppColor.bgSideMenu,
                      //         fontWeight: FontWeight.w600,
                      //         fontFamily: "Poppins"),
                      //     selectedTextStyle: TextStyle(
                      //         color: AppColor.bgSideMenu,
                      //         fontWeight: FontWeight.w600,
                      //         fontFamily: "Poppins"),
                      //     selectedColor: AppColor.orange,
                      //     onSelected: (index, isSelected) =>
                      //         print('$index button is selected'),
                      //     buttons: [
                      //       "Male",
                      //       "Female",
                      //     ],
                      //   ),
                       ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Place of Birth",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.orange)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                   "Region", ),
                              Text(
                                   "City", ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Woreda",),
                              Text(
                                  "City", ),
                              Text(
                                   "Region", ),
                            ],
                          ),
                          Text(
                               "Sub City",),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Place of Residence",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.orange)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Region", ),
                              Text(
                                   "City", ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Woreda",),
                              Text(
                                   "Kebele", ),
                              Text(
                                  "H.No", ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Postal Code", ),
                              Text(
                                   "Sub City", ),
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
                          Text("Place of Work",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.orange)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Name of institution",
                               ),
                              Text(
                                   "Job Profession",
                                  ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Region", ),
                              Text(
                                   "City",),
                              Text(
                                  "P.O.Box", ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Woreda",),
                              Text(
                                  "Kebele", ),
                              Text(
                                 "H.No", ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Work Number",),
                              Text(
                                   "Sub City",)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Uploaded CV",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.bgSideMenu)),
                          Text(
                              "Youtube Link"),

                          // FileUploadButton()
                          // DropDown(
                          //   items: ["Video", "Youtube link", "Pdf"],
                          //   hint: Text("Type of file"),
                          //   icon: Icon(
                          //     Icons.expand_more,
                          //     color: Colors.blue,
                          //   ),
                          //   onChanged: print,
                          // ),
                        ],
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     // Checkbox(
                    //     //     checkColor: Colors.greenAccent,
                    //     //     activeColor: Colors.red,
                    //     //     value: false,
                    //     //     onChanged: checkBoxCallBack),
                    //     Checkbox(
                    //       value: isChecked,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           isChecked = value!;
                    //           print(isChecked);
                    //         });
                    //       },
                    //     ),
                    //     Text(
                    //       "I've agreed to the ",
                    //       style: TextStyle(
                    //         fontFamily: "Poppins",
                    //         fontSize: 11,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () => setState(() {
                    //         //   _launched = _launchInWebViewOrVC(
                    //         //       "https://www.facebook.com/pg/የኢትዮጵያ-ተወዛዋዦች-ጥበብ-ማሕበር-Ethiopian-Dance-Art-Association-445934009270053/photos/");
                    //       }),
                    //       child: Text(
                    //         "Terms and conditions ",
                    //         style: TextStyle(
                    //             color: Colors.blue, fontFamily: "Poppins"),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // GestureDetector(
                    //   // onTap: () {
                    //   //   if (isChecked == true) {
                    //   //     print("can update");
                    //   //   } else {
                    //   //     print("cant");
                    //   //   }
                    //   // },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       boxShadow: [
                    //         BoxShadow(blurRadius: 0.4, color: Colors.white)
                    //       ],
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: isChecked == true
                    //           ? Color(0xFFEF8242)
                    //           : Color(0xFFEF8242),
                    //     ),
                    //     width: 100,
                    //     padding: EdgeInsets.symmetric(vertical: 5),
                    //     child: Center(
                    //       child: Text(
                    //         "Update",
                    //         style: TextStyle(
                    //           fontFamily: "Poppins",
                    //           fontSize: 17,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class FileUploadButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         if (picked != null) {
//           print(picked.files.first.name);
//         }
//       }
//       child: Container(
//         margin: EdgeInsets.only(top: 15),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Color(0xFF082534), borderRadius: BorderRadius.circular(5)),
//         child: Text(
//           'UPLOAD FILE',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }



