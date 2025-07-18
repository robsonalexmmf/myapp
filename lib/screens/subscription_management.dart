import 'package:flutter/material.dart';
import '../mock_data.dart';

class SubscriptionManagementPage extends StatelessWidget {
  const SubscriptionManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions = MockData.subscriptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Assinatura'),
      ),
      body: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = subscriptions[index];
          return ListTile(
            title: Text('Plano: ${subscription['plan']}'),
            subtitle: Text('Status: ${subscription['status']}'),
            trailing: Text('Válido até: ${subscription['endDate']}'),
          );
        },
      ),
    );
  }
}
