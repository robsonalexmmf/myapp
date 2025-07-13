import 'package:flutter/material.dart';
import '../mock_data.dart';

class MessageCenterPage extends StatelessWidget {
  const MessageCenterPage({Key? key}) : super(key: key);

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
              // TODO: Abrir chat detalhado
            },
          );
        },
      ),
    );
  }
}
