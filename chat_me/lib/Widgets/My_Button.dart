import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  //Attributes
  late final Color color;
  late final String text;
  final VoidCallback OnPressed;

  //Constructor
  MyButton({required this.color,required this.text,required this.OnPressed});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap:OnPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: color,
          ),
          child: Text(text,style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),),
        ),
      ),
    );
  }

}