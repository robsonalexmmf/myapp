import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'chat_detail.dart';

class MessageCenterPage extends StatelessWidget {
  const MessageCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = MockData.messages;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Central de Mensagens'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            title: Text('Prestador: ${message['providerName'] ?? message['to']}'),
            subtitle: Text('Última mensagem: ${message['lastMessage'] ?? message['content']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(chat: message),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
