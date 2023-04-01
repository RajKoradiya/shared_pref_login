// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_pref_login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
void main() {
  runApp(MySplashScreen());
}

class MySplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SplashScreen",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "Login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Icon(Icons.account_circle, color: Colors.white,size: 100,),
        ),
      ),
    );
  }

  void whereToGo() async{
    var prefs = await SharedPreferences.getInstance();
    var isLoggedin = prefs.getBool(KEYLOGIN);
    Timer(Duration(seconds: 2),(){
      if(isLoggedin != null){
        if(isLoggedin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
        }
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }

    });
  }

}

