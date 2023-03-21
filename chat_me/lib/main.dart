import 'package:chat_me/Controllers/ChatController.dart';
import 'package:chat_me/Controllers/LoginController.dart';
import 'package:chat_me/MiddleWare/MiddelWare.dart';
import 'package:chat_me/Views/Chat_Screen.dart';
import 'package:chat_me/Views/Register_Screen.dart';
import 'package:chat_me/Views/SignIn_Screen.dart';
import 'package:chat_me/Views/Welcome_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/RegisterController.dart';


//global SharedPrefrence Variable
SharedPreferences ?sharedPref;



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPref=await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>RegisterController()),
        ChangeNotifierProvider(create: (context)=>LoginController()),
        ChangeNotifierProvider(create: (context)=>ChatController()),

      ],
      child: GetMaterialApp(
        getPages: [
          GetPage(name: "/", page:()=> WelcomeScreen(),middlewares: [MiddleWare()]),
          GetPage(name: "/Login", page:()=> SignIn(),),
          GetPage(name: "/Register", page:()=> Register(),),
          GetPage(name: "/Chat", page:()=> ChatScreen(),),
        ],
        theme: ThemeData.light(),
      )
    );

  }
}
