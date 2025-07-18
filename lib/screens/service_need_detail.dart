import 'package:flutter/material.dart';

class ServiceNeedDetailPage extends StatelessWidget {
  final Map<String, dynamic> need;

  const ServiceNeedDetailPage({super.key, required this.need});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Necessidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo: ${need['type']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Localização: ${need['location']}'),
            const SizedBox(height: 8),
            Text('Status: ${need['status']}'),
            const SizedBox(height: 8),
            // Adicione mais campos conforme necessário
          ],
        ),
      ),
    );
  }
}
