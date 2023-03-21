import 'package:chat_me/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class WelcomeScreen extends StatefulWidget{
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset("images/logochat2.jpg",
                    fit: BoxFit.fill,),
                ),
                Text("Chat Me",style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800]
                ),)
              ],
            ),
          ),
          Material(
            child: MyButton(
                color: Colors.yellow[800]!,
                text: "Sign in",
                OnPressed:(){
                  Get.toNamed("/Login");
                }
                ),
          ),
          Material(
            child: MyButton(
                color: Colors.blue[800]!,
                text: "Register",
                OnPressed: (){
                    Get.toNamed("/Register");
                }),
          )
        ],
      ),
    );
  }
}