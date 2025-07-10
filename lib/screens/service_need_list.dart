import 'package:flutter/material.dart';

class ServiceNeedListPage extends StatelessWidget {
  const ServiceNeedListPage({Key? key}) : super(key: key);

  // TODO: Fetch and filter service needs by geolocation from backend

  @override
  Widget build(BuildContext context) {
    // Placeholder list of service needs
    final serviceNeeds = [
      {'type': 'Buscar Carro', 'description': 'Buscar carro na rua X', 'distance': '2 km'},
      {'type': 'Lavagem Expressa', 'description': 'Lavagem rápida', 'distance': '5 km'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Necessidades de Serviço Próximas'),
      ),
      body: ListView.builder(
        itemCount: serviceNeeds.length,
        itemBuilder: (context, index) {
          final need = serviceNeeds[index];
          return ListTile(
            title: Text(need['type']!),
            subtitle: Text('${need['description']} - ${need['distance']}'),
            onTap: () {
              // TODO: Navigate to proposal submission for this need
            },
          );
        },
      ),
    );
  }
}
