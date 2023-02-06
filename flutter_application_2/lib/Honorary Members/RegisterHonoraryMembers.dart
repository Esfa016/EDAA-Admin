import 'package:flutter/material.dart';
import 'package:flutter_application_2/Controllers%20and%20other%20stuff/Cont.dart';
import 'package:group_button/group_button.dart';

import '../app_colors.dart';
import '../side_bar_menu.dart';
class RegisterHonoraryMembers extends StatefulWidget {
  @override
  _RegisterHonoraryMembersState createState() => _RegisterHonoraryMembersState();
}

class _RegisterHonoraryMembersState extends State<RegisterHonoraryMembers> {
  List<String> _memberType = ["Tradtional Dancer", "Modern Dancer", "Traditoinal Chereographer", "Modern Chereographer"];

  String? _selectedColor;
  bool isChecked = false;
  String gender="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:  SafeArea(

       child: Row(
         children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Expanded(
                 child: SideBar(),
               ),

               // Expanded(
               //   flex: 5,
               //   child: HonorayMemberConsolePage(),
               // ),

               Container(

               //  margin: EdgeInsets.all(10),
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
                               decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   image: DecorationImage(
                                       image: NetworkImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPcAAADMCAMAAACY78UPAAAAPFBMVEX29vawsLD5+fm6urqtra3CwsKysrLy8vLi4uLe3t7m5uaxsbHp6enFxcXNzc3s7OzT09O9vb3Q0NDZ2dlO/F6aAAAFFUlEQVR4nO2dyXarMAxAQQYzT+H///UZkjRNHyHEtmyJ6C66aLvgHnmQDZaTRBAEQRAEQRCEO3An9oMEY3Et2nKeR8Nc1UPyBfYAQ9VPOvtNqrqxTk7sDkndq0X0L+Z3TT4Xp1Q3ke71hvMv96lKzmYOUE470nf35lKcyhxK9d56NU/785hDOx2SvrX3yzlaOxT9cevVXJcnEIdSf6a9mHfsQw4fBvse8pq1OBTKRnsxnxmLQ/t5G/8R79mKQ2ltvYjnsZ/fEqhctI34FNvACldtpuJujZytOLTu2stEzm1wK7QHbSM+8hKHDzLyfXFWOStcPGkbitgyx4Han3aWMwq48qbNKWP12coXcS4tffCqzWYyg86vd5q1sZUO4SVjefJmMbRB7tubR8A99+7Vm0HAvffuVXyIrfUeBG0Gmy8wY3inOrbXO2DC0DbLk9hibyhQwk2+oSM1c/INHWU0X6A+hfvZZtnwpr3xgpC03LxJpy7ue8cv0aS9rd4CHoL0KhxyLO00q2PL7QBYwxr17SY0bdoDOlK2tnpTztjQpjHiu2zet5h+eU+EvT2+L/gP8aYHojfpdo7Yv1PKCfq3juffOn9/a74GPl8A//GuKHt/63rM75vvJ2/S6+8v3W9B3F+jPI0liPuppLcdEPfPab8RRevgKrbZGwocbdrZWoLylcfqTXn2XkBq6NSbeYKTopNOzq+gvDIhnazdwPieiXjSsoIwhROfvG94DziLcCP0cB7h9p67kM9Z7nj+uKeJ7XMYsD0NuwWnkzWDR20eg9oVjy1dM0hZHnibxDNuB+D9dHHi2ywbeDkoyWYKewCtB21OY9od90ODtL9RfAnUrtqxDSyBtnEIOcO+fce+jAmLLZY9LLcZs5Ty688D2GVumRp4axvx4eO2nmUX7tYr47Haa49gt6fQNsNbd9w80+xS09dAmx+st6dn9iXInoC2T9+ZZ5k6mfUCFPNekUXzp64+ZSXRpZTonDcbBVTNr1Rfni/UD0xA67lT+qlc7tRXw5nr5d64Fkiuy8pQ1kPxDfWRH3xbOWxBEARBYAvsEfvhELhqLbdYjH2XT0oprXXTNOanVmrKu36cy7q4/+MZMCJFW43dpNOfjHxjXXJFT91YtQVz+UV5WYWkm7KvlqO3iz24yhvncr21w2o/dV2ZVtxu9jCP246TnfKTvLrUfFblAOv1LE7OD3fNY0MCYLjsXc9ip94Sb/CQVAeuZ7FQJ73hCMVoX9f/nbqmepUNJO93ip3MSV5lA8UF1Xo1z8iZw4zWwp/M05FSP4fW54eZ++aKzAdtpmOHsl7NexohDxjsmziJS3zQKirumRP4LgDrQOi++BR3YHf5YMlNXMf8AAaGILPXNvE6uc/rGz4n2jmEuNrRKnz4uYnHSTxGxMHjGRJr8Qh93NMFRG40wU/UebuAyI3Q58IRC8R+ROATCT4uVfND2IM3RRPb94eQh2bRqrRYELD+IJ1WvhCwpeNVWbMh1BUAMVbcewRbjVPIWJ4IcnSWWrhDBRyxxrk1IbRJDeZXQgzpSIWn3AgwhyMVGnMDP2lDrBzpAP6hSkop6i/wGzrB0XwBewpHrHjtAnY9PprdG38mg5GoN/IheSr7S/+BXAqCZNayoMQbxzu24Ask3uIt3uIt3uIt3uIt3uJNEfEWb/EWb/EWb/EWb/EWb4qIt3iLt3iLt3gz9s6wvXtFE+wrIHYricUEV1sQBEEQBEEQgvAP11lefkObcB4AAAAASUVORK5CYII="),
                                       fit: BoxFit.cover)),
                               child: GestureDetector(
                                 onTap: () {},
                               ),
                             ),
                           ),
                           GestureDetector(
                             child: Container(
                               width: 30,
                               height: 30,
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: NetworkImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPcAAADMCAMAAACY78UPAAAAPFBMVEX29vawsLD5+fm6urqtra3CwsKysrLy8vLi4uLe3t7m5uaxsbHp6enFxcXNzc3s7OzT09O9vb3Q0NDZ2dlO/F6aAAAFFUlEQVR4nO2dyXarMAxAQQYzT+H///UZkjRNHyHEtmyJ6C66aLvgHnmQDZaTRBAEQRAEQRCEO3An9oMEY3Et2nKeR8Nc1UPyBfYAQ9VPOvtNqrqxTk7sDkndq0X0L+Z3TT4Xp1Q3ke71hvMv96lKzmYOUE470nf35lKcyhxK9d56NU/785hDOx2SvrX3yzlaOxT9cevVXJcnEIdSf6a9mHfsQw4fBvse8pq1OBTKRnsxnxmLQ/t5G/8R79mKQ2ltvYjnsZ/fEqhctI34FNvACldtpuJujZytOLTu2stEzm1wK7QHbSM+8hKHDzLyfXFWOStcPGkbitgyx4Han3aWMwq48qbNKWP12coXcS4tffCqzWYyg86vd5q1sZUO4SVjefJmMbRB7tubR8A99+7Vm0HAvffuVXyIrfUeBG0Gmy8wY3inOrbXO2DC0DbLk9hibyhQwk2+oSM1c/INHWU0X6A+hfvZZtnwpr3xgpC03LxJpy7ue8cv0aS9rd4CHoL0KhxyLO00q2PL7QBYwxr17SY0bdoDOlK2tnpTztjQpjHiu2zet5h+eU+EvT2+L/gP8aYHojfpdo7Yv1PKCfq3juffOn9/a74GPl8A//GuKHt/63rM75vvJ2/S6+8v3W9B3F+jPI0liPuppLcdEPfPab8RRevgKrbZGwocbdrZWoLylcfqTXn2XkBq6NSbeYKTopNOzq+gvDIhnazdwPieiXjSsoIwhROfvG94DziLcCP0cB7h9p67kM9Z7nj+uKeJ7XMYsD0NuwWnkzWDR20eg9oVjy1dM0hZHnibxDNuB+D9dHHi2ywbeDkoyWYKewCtB21OY9od90ODtL9RfAnUrtqxDSyBtnEIOcO+fce+jAmLLZY9LLcZs5Ty688D2GVumRp4axvx4eO2nmUX7tYr47Haa49gt6fQNsNbd9w80+xS09dAmx+st6dn9iXInoC2T9+ZZ5k6mfUCFPNekUXzp64+ZSXRpZTonDcbBVTNr1Rfni/UD0xA67lT+qlc7tRXw5nr5d64Fkiuy8pQ1kPxDfWRH3xbOWxBEARBYAvsEfvhELhqLbdYjH2XT0oprXXTNOanVmrKu36cy7q4/+MZMCJFW43dpNOfjHxjXXJFT91YtQVz+UV5WYWkm7KvlqO3iz24yhvncr21w2o/dV2ZVtxu9jCP246TnfKTvLrUfFblAOv1LE7OD3fNY0MCYLjsXc9ip94Sb/CQVAeuZ7FQJ73hCMVoX9f/nbqmepUNJO93ip3MSV5lA8UF1Xo1z8iZw4zWwp/M05FSP4fW54eZ++aKzAdtpmOHsl7NexohDxjsmziJS3zQKirumRP4LgDrQOi++BR3YHf5YMlNXMf8AAaGILPXNvE6uc/rGz4n2jmEuNrRKnz4uYnHSTxGxMHjGRJr8Qh93NMFRG40wU/UebuAyI3Q58IRC8R+ROATCT4uVfND2IM3RRPb94eQh2bRqrRYELD+IJ1WvhCwpeNVWbMh1BUAMVbcewRbjVPIWJ4IcnSWWrhDBRyxxrk1IbRJDeZXQgzpSIWn3AgwhyMVGnMDP2lDrBzpAP6hSkop6i/wGzrB0XwBewpHrHjtAnY9PprdG38mg5GoN/IheSr7S/+BXAqCZNayoMQbxzu24Ask3uIt3uIt3uIt3uIt3uJNEfEWb/EWb/EWb/EWb/EWb4qIt3iLt3iLt3gz9s6wvXtFE+wrIHYricUEV1sQBEEQBEEQgvAP11lefkObcB4AAAAASUVORK5CYII='),
                                 ),
                               ),
                             ),
                             onTap: () {
                               // c.launch(context);
                             },
                           ),
                         ],
                       ),
                       Container(
                         child: Column(
                           children: [
                             TextField(
                               decoration: InputDecoration(
                                 labelText: 'Full Name'
                               ),
                               controller: fullNameController,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   labelText: 'Phone number'
                               ),
                               controller: workPhoneController,
                             ),

                             //             widget.dropdownDatePicker,
                             TextField(
                               decoration: InputDecoration(
                                   labelText: 'Email'
                               ),
                               controller: fullNameController,
                             ),


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
                                   gender = index.toString(),
                                   //print('$index button is selected'),
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
                                 TextField(
                                    decoration: InputDecoration(
                                       labelText: 'Kebele'
                                    ),
                                     controller: workKebeleController,
                                     ),
                                 TextField(
                                   decoration: InputDecoration(
                                     labelText: 'Woreda'
                                   ),
                                   controller: workWoredaController,
                                     ),
                               ],
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 TextField(
                                   decoration: InputDecoration(
                                       labelText: 'Kebele'
                                   ),
                                   controller: workKebeleController,
                                 ),
                                 TextField(
                                   decoration: InputDecoration(
                                       labelText: 'Woreda'
                                   ),
                                   controller: workWoredaController,
                                 ),
                                 TextField(
                                   decoration: InputDecoration(
                                       labelText: 'Subcity'
                                   ),
                                   controller: workSubCityController,
                                 ),
                               ],
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   labelText: 'House Number'
                               ),
                               controller: workHouseController,
                             ),
                             SizedBox(
                               height: 30,
                             ),
                             TextField(
                               decoration: InputDecoration(
                                   labelText: 'Years Worked'
                               ),
                               controller: yearsWorkedController,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 DropdownButton<String>(
                                   onChanged: (value) {
                                     setState(() {
                                       _selectedColor = value;
                                     });
                                   },
                                   value: _selectedColor,

                                   // Hide the default underline
                                   underline: Container(),
                                   hint: Center(
                                       child: Text(
                                         'Member Type',
                                         style: TextStyle(color: Colors.white),
                                       )),
                                   icon: Icon(
                                     Icons.arrow_downward,
                                     color: Colors.yellow,
                                   ),
                                   isExpanded: true,

                                   // The list of options
                                   items: _memberType
                                       .map((e) => DropdownMenuItem(
                                     child: Container(
                                       alignment: Alignment.centerLeft,
                                       child: Text(
                                         e,
                                         style: TextStyle(fontSize: 18),
                                       ),
                                     ),
                                     value: e,
                                   ))
                                       .toList(),

                                   // Customize the selected item
                                   selectedItemBuilder: (BuildContext context) =>
                                       _memberType
                                           .map((e) => Center(
                                         child: Text(
                                           e,
                                           style: TextStyle(
                                               fontSize: 18,
                                               color: Colors.amber,
                                               fontStyle: FontStyle.italic,
                                               fontWeight:
                                               FontWeight.bold),
                                         ),
                                       ))
                                           .toList(),
                                 ),
                               ],
                             )
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 40,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           // Checkbox(
                           //     checkColor: Colors.greenAccent,
                           //     activeColor: Colors.red,
                           //     value: false,
                           //     onChanged: checkBoxCallBack),
                           Checkbox(
                             value: isChecked,
                             onChanged: (value) {
                               setState(() {
                                 isChecked = value!;
                                 print(isChecked);
                               });
                             },
                           ),
                           Text(
                             "I've agreed to the ",
                             style: TextStyle(
                               fontFamily: "Poppins",
                               fontSize: 11,
                             ),
                           ),
                           GestureDetector(
                             onTap: () =>
                                 setState(() {
                                   //   _launched = _launchInWebViewOrVC(
                                   //       "https://www.facebook.com/pg/የኢትዮጵያ-ተወዛዋዦች-ጥበብ-ማሕበር-Ethiopian-Dance-Art-Association-445934009270053/photos/");
                                 }),
                             child: Text(
                               "Terms and conditions ",
                               style: TextStyle(
                                   color: Colors.blue, fontFamily: "Poppins"),
                             ),
                           ),
                         ],
                       ),
                       GestureDetector(
                         onTap: () {
                           if (isChecked == true) {
                             print(gender);
                           } else {
                             print("cant");
                           }
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             boxShadow: [
                               BoxShadow(blurRadius: 0.4, color: Colors.white)
                             ],
                             borderRadius: BorderRadius.circular(20),
                             color: isChecked == true
                                 ? Color(0xFFEF8242)
                                 : Colors.white,
                           ),
                           width: 100,
                           padding: EdgeInsets.symmetric(vertical: 5),
                           child: Center(
                             child: Text(
                               "Register",
                               style: TextStyle(
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
             ],
           ),
         ],
       ),
    ),
    );
  }
  }
