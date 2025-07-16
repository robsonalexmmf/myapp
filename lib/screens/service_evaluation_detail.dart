import 'package:flutter/material.dart';

class ServiceEvaluationDetailPage extends StatelessWidget {
  final Map<String, dynamic> review;

  const ServiceEvaluationDetailPage({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar Serviço Detalhado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Prestador: ${review['providerName']}'),
            const SizedBox(height: 8),
            Text('Avaliação atual: ${review['rating']}'),
            const SizedBox(height: 8),
            Text('Comentário: ${review['comment']}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implementar salvar avaliação
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Avaliação salva com sucesso')),
                );
                Navigator.pop(context);
              },
              child: const Text('Salvar Avaliação'),
            ),
          ],
        ),
      ),
    );
  }
}
