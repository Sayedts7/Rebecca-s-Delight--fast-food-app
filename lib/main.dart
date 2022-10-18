import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rebeca_delight/screens/category/biryanicategory.dart';
import 'package:rebeca_delight/screens/category/burger_categoires.dart';
import 'package:rebeca_delight/screens/category/donut_category.dart';
import 'package:rebeca_delight/screens/category/pizza_category.dart';


import 'package:rebeca_delight/screens/home_screen.dart';
import 'package:rebeca_delight/screens/items_pages/item_screen.dart';
import 'package:rebeca_delight/screens/maps/location.dart';
import 'package:rebeca_delight/screens/maps/search_map.dart';
import 'package:rebeca_delight/screens/profile.dart';
import 'package:rebeca_delight/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     // statusBarColor: Colors.transparent,
   //   statusBarIconBrightness: Brightness.dark,
    //));
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness:Brightness.dark,

        fontFamily: 'DancingScript'
      ),
      initialRoute: '/',
      routes: {
        '/' : (context)=> Splash(),
        '/login': (context)=> Login(),
        '/signup': (context)=> Signup(),
        '/home' : (context)=> Home_Screen(),
       // '/location': (context)=> location(lat: '', lang: "",),
        '/cBurgers': (context)=> category(),
        '/cBiryani': (context)=> categoryB(),
        '/cPizza': (context)=> Pizaa_category(),
        '/cDonut': (context)=> Category_donut(),
        '/items': (context)=> item_screen(image: '', text: '', name: '', price: '', time: ''),
        '/profile' :(context)=> Profile(),
        '/Searchmap' : (context)=> SearchMap(),
      },

    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;


    if( isLogin)
      {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/signup');
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff241e20),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Center(child: Image(image: AssetImage('images/logo2.png'),)),
          SizedBox(height: 30),
          Text("Rebeca's Delight", style: TextStyle(color:Colors.white, fontFamily: 'DancingScript', fontWeight: FontWeight.bold, fontSize: 40),)
        ],
      ),
    );
  }
}
