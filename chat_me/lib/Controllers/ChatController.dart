import 'package:chat_me/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController with ChangeNotifier{

  final CurrentUser=FirebaseAuth.instance.currentUser;
  List<Text>MessagesList=[];

  SignOutMethod()async{
    await FirebaseAuth.instance.signOut();
    Get.offNamed("/");
    sharedPref!.clear();
    notifyListeners();
  }


  AddMessage(String ?message,String ?sender) {
    CollectionReference users = FirebaseFirestore.instance.collection(
        'Messages');
    // Call the user's CollectionReference to add a new user
    users
        .add({
      'text': message, // John Doe
      'Sender': sender,
      'Time':FieldValue.serverTimestamp()// Stokes and Sons
    })
        .then((value) => print("Message Added"))
        .catchError((error) => print("Failed to add Message : $error"));
    notifyListeners();
  }

  changeTheme(){
    if(Get.isDarkMode){
      Get.changeTheme(ThemeData.light());
    }else{
      Get.changeTheme(ThemeData.dark());
    }
    notifyListeners();
  }


}


