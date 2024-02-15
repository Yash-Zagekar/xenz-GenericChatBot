import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget{
  final String text;
  const ExampleWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration:  BoxDecoration(
        color:  const Color.fromARGB(255, 34, 34, 34),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 80, 80, 80))
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      child: Text(text,style: const TextStyle(
              fontFamily: "Lexend",
              fontSize: 14,
              color: Color.fromARGB(255, 142, 141, 141),
             ),),
      
    );
  }
}