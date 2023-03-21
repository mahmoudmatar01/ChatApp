import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiddelEarwController extends GetxController{

  SharedPreferences ?sharedPref;


  PutValueinSharedPrefrence()async{
    sharedPref=await SharedPreferences.getInstance();
    sharedPref!.setString("key", "1");
  }


  DeleteValueFromSharedPrefrence()async{
    sharedPref=await SharedPreferences.getInstance();
    sharedPref!.clear();
  }

}