import 'package:flutter/material.dart';
import 'package:ghotest/constants/AppColors.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: const Text("Chat")),
      body: Center(child: Text("Chat Page Content")),
    );
  }
}
