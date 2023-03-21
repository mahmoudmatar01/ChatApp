import 'package:chat_me/Controllers/LoginController.dart';
import 'package:chat_me/Widgets/My_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

 String ?UserName;
 String ?Password;
 bool _obsucre=true;

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
                      Text("Log in",style:TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800]
                      ))
                    ],
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("images/logochat2.jpg",),
                  ),
                  TextFormField(
                    onChanged: (val){
                      UserName=val;
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
                    obscureText:_obsucre,
                    decoration:  InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _obsucre= !_obsucre;
                              });
                              },
                            icon:_obsucre?const Icon(Icons.visibility):const Icon(Icons.visibility_off)),
                        prefixIcon: const Icon(Icons.key),
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                                color: Colors.black87
                            )
                        )
                    ),
                  ),
                  Consumer<LoginController>(builder: (context,model,child){
                    return Material(
                      child: MyButton(
                          color: Colors.blue[800]!,
                          text: "Log in",
                          OnPressed: ()async{
                            await model.LoginMethod(UserName!, Password!);
                          }),
                    );
                  })
                ],
              ),
            ),
          ),
    );
  }
}