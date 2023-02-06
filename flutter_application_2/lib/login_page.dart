// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_declarations

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Dashboard/AdminScaffold.dart';
import 'package:flutter_application_2/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_2/consts.dart';
import 'package:flutter_application_2/Dashboard/home_page.dart';
import 'package:flutter_application_2/sign_up.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Controllers and other stuff/Cont.dart';
import 'R/Dash.dart';
import 'Services/AuthServiceAdmin.dart';

final Color facebookColor = Colors.white;
final Color googleColor = Colors.white;

var mProgress = CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(
    Colors.red,
  ),
);

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPageHere());
}*/

// class LoginPageHere extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'EDAA',
//       theme: ThemeData(),
//       home: ChangeNotifierProvider(
//           create: (context) => DbContext(), child: HomePage()),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isloading = false;
  bool visible = false;

  @override
  void initState() {
    // someA();
    // TODO: implement initState
    setState(() {
      isloading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dbContext = Provider.of<DbContext>(context);
    print(dbContext.traditionalDancers.length);
    return ModalProgressHUD(
      opacity: 0,
      progressIndicator: CircularProgressIndicator(
        strokeWidth: 20,
        color: AppColor.orange,
      ),
      inAsyncCall: isloading,
      child: Scaffold(
        body: SafeArea(
            child: Row(
          children: [
            screenWidth(context) < 1000
                ? Container()
                : Expanded(
                    child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF092E40),
                            Color(0xFF092E40),
                            Color(0xFF265168),
                            Color(0xFFEF8242),
                            Color(0xFFFFFFFF),
                          ]),
                    ),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(100)),
                        Text(
                          'WELCOME TO ',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        Hero(
                          tag: "image",
                          child: Image(
                            alignment: Alignment.topCenter,
                            width: 700,
                            height: 200,
                            image: AssetImage("images/websitelogo.png"),
                          ),
                        ),
                      ],
                    ),
                  )),
            Expanded(
                child: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.07),
              child: Card(
                elevation: 11,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: 600,
                  padding: EdgeInsets.all(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please Login to Your Account',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: TextField(
                          autofocus: true,
                          controller: emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFEF8242),
                              ),
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Color(0xFFEF8242),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                            ),
                            suffixIcon: Icon(
                              FontAwesomeIcons.mailBulk,
                              size: 17,
                              color: Color(0xFFEF8242),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: 250,
                        child: TextField(
                          controller: passWordController,
                          obscureText: visible == true ? false : true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFEF8242),
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Color(0xFFEF8242),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (visible == false) {
                                    visible = true;
                                  } else if (visible == true) {
                                    visible = false;
                                  }
                                  print(visible);
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.eyeSlash,
                                size: 17,
                                color: Color(0xFFEF8242),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xFFEF8242))),
                          onPressed: () async {
                            //   someA();
                            if (emailController.text.isEmpty ||
                                passWordController.text.isEmpty) {
                              Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: 'Error',
                                      desc: 'Please fill all the fields above!')
                                  .show();
                              // print('Error!');
                            } else {
                  
                                setState(() {
                                  isloading = true;
                                });
                              dbContext
                                    .login(emailController.text,
                                        passWordController.text)
                                    .then((value) => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage())
                                              // MaterialPageRoute(
                                              //     builder: (context) => ChangeNotifierProvider(
                                              //       create: (context)=>DbContext(),
                                              //         child: HomePage()))

                                              ),
                                          emailController.clear(),
                                          passWordController.clear()
                                        })
                                    .catchError((onError) => {
                                          Alert(
                                                  context: context,
                                                  type: AlertType.error,
                                                  title: 'login unseccessful',
                                                  desc: 'Invalid Credentials!')
                                              .show()
                                              .then((value) => {
                                                    setState(() {
                                                      isloading = false;
                                                    })
                                                  })
                                        });
                                print(emailController.text +
                                    passWordController.text);
                              } 
                            }
                          ,
                          color: Color(0xFFEF8242),
                          textColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text("Log In",
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Poppins')),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        )),
      ),
    );
  }
}

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
