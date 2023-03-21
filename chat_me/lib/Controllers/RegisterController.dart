
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/My_Alert.dart';
import '../main.dart';

class RegisterController with ChangeNotifier{

  String?Email;
  String?Password;
  String?UserName;


  RegisterMethod(String Email2,String Password2) async{

    Email=Email2;
    Password=Password2;
    final CurrentUser=FirebaseAuth.instance.currentUser;
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: Email2,
          password: Password2,
        );
        if(CurrentUser==null){
          const Center(child: CircularProgressIndicator(color: Colors.black),
          );
        }
        sharedPref!.setString("key","1");
        Get.offNamed("/Chat");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
           MyAlert(
                Content: "The Password is too Weak").ShowAlert();
        }
        else if (e.code == 'email-already-in-use') {
           MyAlert(
                Content: "The account already exists for that email.").ShowAlert();
        }
        else{
          MyAlert(
              Content: "you Should Write Your Full Email",Subtitle: "Example: user11@Example.com").ShowAlert();
        }
      } catch (e) {

      }
     notifyListeners();
  }



}