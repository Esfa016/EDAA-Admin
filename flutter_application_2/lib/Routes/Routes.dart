import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard/dash.dart';
import 'package:flutter_application_2/Dashboard/dashboard.dart';
import 'package:flutter_application_2/Dashboard/home_page.dart';
import 'package:flutter_application_2/R/Dash.dart';
import 'package:flutter_application_2/Services/AuthServiceAdmin.dart';
import 'package:flutter_application_2/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
class Routes
{

  Widget? appRouter(RouteSettings rSetting) {
  switch (rSetting.name) {
    case '/':
      return LoginPage();
  // return PageTransition(
  // child: ChangeNotifierProvider(
  //     create: (context)=>DbContext(),
  //     child: LoginPage()), type: PageTransitionType.rightToLeft);
   break;

  // break;

  case '/home_page':
 // return MaterialPageRoute(builder: (context) => HomePage());
  return HomePage();
  break;

    case '/dashboard':
      return ChangeNotifierProvider(
          create: (context)=>DbContext(),
          child: DashboardNew());
      // return PageTransition(
      //     child: ChangeNotifierProvider(
      //         create: (context)=>DbContext(),
      //         child: DashboardNew()), type: PageTransitionType.rightToLeft);
      break;



  // case '/news_page':
  //   return PageTransition(
  //       child: news_page(), type: PageTransitionType.rightToLeft);
  //   break;
  // case '/event_page':
  //   return PageTransition(
  //       child: events_page(), type: PageTransitionType.rightToLeft);
  //   break;

  // case '/profile_page':
  //   return PageTransition(
  //       child: profile_page(
  //         ID: 123456,
  //         firstName: "Abel",
  //         lastName: "Dinku",
  //         image: const AssetImage('logo.png'),
  //       ),
  //       type: PageTransitionType.rightToLeft);
  //   break;

  default:
  return null;
  }
  }
  }
