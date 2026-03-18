import 'package:flutter/material.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/chat/views/widget/animated_bubble.dart';
import 'package:houses/featuers/chat/views/widget/input_area.dart';
import 'package:houses/featuers/chat/views/widget/typing_indicator.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffF4F6FA),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TitelTextWidget(text: "Messages", fontSize: 20),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// الرسائل
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                AnimatedBubble(
                  isMe: false,
                  message: "Hello 👋 Interested in the apartment?",
                  time: "10:22",
                ),
                AnimatedBubble(
                  isMe: true,
                  message: "Yes! Is it still available?",
                  time: "10:24",
                ),
                AnimatedBubble(
                  isMe: false,
                  message: "Sure, you can visit tomorrow.",
                  time: "10:25",
                ),
                AnimatedBubble(
                  isMe: true,
                  message: "Perfect! See you then ✨",
                  time: "10:27",
                ),

                /// Typing indicator
                TypingIndicator(),
              ],
            ),
          ),

          /// صندوق الكتابة
          const InputArea(),
        ],
      ),
    );
  }
}

