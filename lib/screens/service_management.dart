import 'package:flutter/material.dart';
import '../mock_data.dart';

class ServiceManagementPage extends StatelessWidget {
  const ServiceManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = MockData.services;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Serviços'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service['name']),
            subtitle: Text(service['description']),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // TODO: Implementar edição do serviço
              },
            ),
          );
        },
      ),
    );
  }
}
