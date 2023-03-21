import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../main.dart';

class MiddleWare extends GetMiddleware  {

  @override
  RouteSettings?redirect(String?route){
    if(sharedPref!.getString("key")!=null){
      return const RouteSettings(name: "/Chat");
    }
    return null;
  }




}