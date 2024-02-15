import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart';
import 'package:zenx_mind/chat_text_field.dart';
import 'package:zenx_mind/chat_text_view.dart';
import 'package:zenx_mind/conversation_chat.dart';
import 'package:zenx_mind/exmaple_conatiner.dart';





class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}
class _HomePage extends State<HomePage>{
  
  final fluttertts = FlutterTts();
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];
  bool get isConversationStarted => conversations.isNotEmpty;
  


  @override

  Widget build(BuildContext context) {
    return  Scaffold(
    
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              if(!isConversationStarted)...[
                const SizedBox(height: 15),
              Image.asset(
              "asset/zenz_logo.png",
              height: 75,
              width: 75),
              // logo 
          
              // text
              const Text("Welcome to \n xenz GenTalk",
              style: TextStyle(
                fontFamily: "Poppins-Light",
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 20),
              const Text("Your Ideas, Our Words",
              style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 18,
                color: Colors.white,
               ),
                ),
              const Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                       Image(
                    image: AssetImage("asset/te.gif"),
                    height: 130,
                    width: 130,),
                   Text("Examples",
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: 18,
                    color: Colors.white,
                   ),
                    ),
                  SizedBox(height: 20),
                
                  ExampleWidget(text: "Can you explain me,what is NLP and it's history "),
                  ExampleWidget(text: "Explain me difference between regression model vs classification model "),
                  ExampleWidget(text: "What are different types of A.I models,with merits and demrits"),
                    ],

                  ),
                ),
              ),
            ),
          ]else 
          Expanded(child: ChatListView(conversations: conversations)),
              // logo   
              
           
                ChatTextField(controller : controller, onSubmitted : (question){

                  controller.clear();
                  // Api calls
                  conversations.add(Conversation(question!, ""));
                  setState(() {});
                post(Uri.parse("https://test-ak1b.onrender.com/get-response"),
                  body: jsonEncode({
                  "text" : question}), 
                  headers: {
                    "Content-Type" : "application/json"}).then((response) {
                    String result = jsonDecode(response.body)['response'];
                    result = result.replaceAll(RegExp(r'\[\^\d+\^\]'), '');
                    result = result.replaceAll("*","");
                    result =result.replaceAll(RegExp(r'[^\x00-\x7F]+'), '');
                    conversations.last = Conversation(conversations.last.question, result);
                    fluttertts.speak(result);
                    setState(() {
                      
                    });
                });
                }),
              
            ],
          ),
        ),
      ),
    ),
      );
  }
}