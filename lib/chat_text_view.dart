import 'package:flutter/material.dart';
import 'package:zenx_mind/conversation_chat.dart';
import 'package:zenx_mind/message_widget.dart';


class ChatListView extends StatefulWidget{
  final List<Conversation> conversations;
  const ChatListView({super.key,required this.conversations,});
  

  @override
  State<ChatListView> createState() => _ChatListView();

}
class _ChatListView extends State<ChatListView>
{

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.conversations.length,
      itemBuilder:(context, index) {
        Conversation conversation = widget.conversations[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
              MessageWidget(text : conversation.question),
              const SizedBox(height: 20),
              conversation.answer.isEmpty
              ? Container(
                alignment: Alignment.centerLeft,
                child: const Image(image: AssetImage("asset/loading.gif"),width: 105,height: 105,)
              )
              : MessageWidget(text: conversation.answer,fromAI: true,)
          ],
        );
      },
    );
    
  }
}