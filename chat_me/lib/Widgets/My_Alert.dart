import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';

class MyAlert{
  String ?Content;
  String ?Subtitle;
  MyAlert({required this.Content, this.Subtitle});
  void ShowAlert(){
    Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      titlePadding: EdgeInsets.only(top: 20),
      content:Subtitle!=null?Column(
        children: [
          Text(Content!,style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.black54
          ),),
          SizedBox(height: 5,),
          Text("${Subtitle}",style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold
          ),),
        ],
      ):Text(Content!),
      title: "Faild",
      textCancel: "Confirm",
      cancelTextColor: Colors.blueGrey,
    );
  }
}