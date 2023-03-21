import 'package:chat_me/Controllers/RegisterController.dart';
import 'package:chat_me/Widgets/My_Alert.dart';
import 'package:chat_me/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class Register extends StatefulWidget{
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String ?Email;
  String ?Password;
  bool _obscure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: Colors.blueGrey,)),
                  Text("Register",style:TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]
                  ))
                ],
              ),
              Container(
                height: 250,
                width: 250,
                child: Image.asset("images/logochat2.jpg",fit:BoxFit.fill,),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "UserName",
                    labelText: "UserName",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.black87
                        )
                    )
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                onChanged: (val){
                  Email=val;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.black87
                        )
                    )
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                onChanged: (val){
                  Password=val;
                },
                obscureText:_obscure,
                decoration:  InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon:IconButton(
                        onPressed:(){
                          setState(() {
                            _obscure=!_obscure;
                          });
                        },
                      icon: _obscure?const Icon(Icons.visibility):const Icon(Icons.visibility_off),
                    ) ,
                    prefixIcon: const Icon(Icons.key),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                            color: Colors.black87
                        )
                    )
                ),
              ),
              Consumer<RegisterController>(builder: (context,model,child){
                return Material(
                  child: MyButton(
                      color: Colors.blue[800]!,
                      text: "Register",
                      OnPressed: ()async {
                        await model.RegisterMethod(Email!, Password!);
                      }
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}