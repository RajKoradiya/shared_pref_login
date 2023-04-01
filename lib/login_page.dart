// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shared_pref_login/home_page.dart';
import 'package:shared_pref_login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  var uName = TextEditingController();
  var uPass = TextEditingController();
  late Animation animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = Tween(begin: 0.0,end: 1.0).animate(animationController);
    animationController.addListener(() {
      setState(() {

      });
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),

      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: animation.value == 0.0 ? 0.0 : 1.0,
          duration: Duration(seconds: 2),
          child: Container(
            width: 300,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle, color: Colors.blue, size: 80,),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: uName,
                  decoration: InputDecoration(
                    label: Text("Username"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1
                      )
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: uPass,
                  decoration: InputDecoration(
                    label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1
                          )
                      )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () async{
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashScreenState.KEYLOGIN, true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }, child: Text("Login")) ,
              ],
            ),
          ),
        ),
      ),
    );
  }
}