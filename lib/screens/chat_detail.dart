import 'package:flutter/material.dart';

class ChatDetailPage extends StatelessWidget {
  final Map<String, dynamic> chat;

  const ChatDetailPage({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat com ${chat['providerName'] ?? chat['to']}'),
      ),
      body: Center(
        child: Text('Aqui será exibido o chat detalhado'),
      ),
    );
  }
}
