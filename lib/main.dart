import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_iti/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';
import 'on_boarding_screen.dart';

int? initScreen;
String? email;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs=await SharedPreferences.getInstance();
  initScreen =prefs.getInt('initScreen');
  await prefs.setInt('initScreen', 1);
  email=prefs.getString("email");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project ITI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
      ),
      initialRoute: initScreen==0||initScreen==null?'onboard':'home',
      routes: {
        'home':(context)=>email==null?const LoginScreen():const MainScreen(),
        'onboard':(context)=>const OnBoardingScreen(),
      },
    );
  }
}


