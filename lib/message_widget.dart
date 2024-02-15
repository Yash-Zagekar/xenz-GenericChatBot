import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget{
  final String text;
  final bool fromAI;


  const MessageWidget({super.key,required this.text, this.fromAI = false});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: fromAI ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .8)
        ,
        decoration: BoxDecoration(
          border: fromAI? Border.all(color:Colors.white) : Border.all(color: const Color.fromARGB(255, 77, 131, 124)),
          color: fromAI ? const Color.fromARGB(255, 34, 34, 34) : const Color.fromARGB(255, 77, 131, 124),
          borderRadius: BorderRadius.circular(8).copyWith(
            bottomLeft: fromAI ?  const Radius.circular(8) : null,
            bottomRight: !fromAI ?  const Radius.circular(8) : null,
          )
        ),
        padding: const EdgeInsets.all(12),
        child: Text(text, style: const TextStyle(fontFamily: 'Lexend', color: Colors.white, fontSize: 16),),
      ),
    );
  }
}