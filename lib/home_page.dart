import 'package:flutter/material.dart';
import 'package:shared_pref_login/login_page.dart';
import 'package:shared_pref_login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue.shade200,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home, color: Colors.white.withOpacity(0.5),size: 100,),
              ElevatedButton(onPressed: () async {
                var pref = await SharedPreferences.getInstance();
                pref.remove(SplashScreenState.KEYLOGIN);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text("Log-Out"))
            ],
          ),
        ),
      ),
    );
  }

}