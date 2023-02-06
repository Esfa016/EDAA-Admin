// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:edaa_admin/Member%20Management/ModernDancers.dart';
import 'package:edaa_admin/Member%20Management/TraditionalChoreographerMemberPage.dart';
import 'package:edaa_admin/Routes/Routes.dart';
import 'package:edaa_admin/Services/AuthServiceAdmin.dart';
import 'package:edaa_admin/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDdx9X5JvO5jG4ntEG-HE5jWP1cbZnDhXo',
          appId: '1:808415506540:web:72b41d91133bacef276849',
          messagingSenderId: '808415506540',
          storageBucket: "edda-53458.appspot.com",
          projectId: 'edda-53458'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Routes myRoute = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child  )=>ResponsiveWrapper.builder(
        BouncingScrollWrapper(child: child!),
        
      maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      title: 'EDAA',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
          create: (context) => DbContext(), child: TraditionalChoreographerMemberPage()),
    );
  }
}
