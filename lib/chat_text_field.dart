import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_to_text.dart';


class ChatTextField extends StatefulWidget{
  final TextEditingController controller;
  final Function(String?) onSubmitted;
  final speechToText = SpeechToText();
  ChatTextField({super.key, required this.controller,required this.onSubmitted,});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 34, 34, 34),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white)
      ),
      
      child: Row(
        children: [
          const SizedBox(width: 10),
          Flexible(
            child: TextField(
            controller: widget.controller,
            cursorColor: Colors.white,
            style: const TextStyle(
              fontFamily: "Lexend", 
              color: Colors.white),
            decoration: const InputDecoration(
              
              hintText: "Ask anything ....",
              hintStyle: TextStyle(
                fontFamily: 'Lexend', 
                color: Colors.white, 
                fontSize: 15),
                border: InputBorder.none),
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(2.0),
             child: IconButton(
            
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 71, 126, 126),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                  
              ),
              
              onPressed: (){
                widget.onSubmitted(widget.controller.text);
              }, 
              icon: const Icon(Icons.send_sharp,color: Colors.white,),
              ),
           ),
         
         
        ],
      ),
    );
    
  }
}