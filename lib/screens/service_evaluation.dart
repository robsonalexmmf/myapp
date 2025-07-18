import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'service_evaluation_detail.dart';

class ServiceEvaluationPage extends StatelessWidget {
  const ServiceEvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = MockData.reviews;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliar Serviço'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ListTile(
            title: Text('Prestador: ${review['providerName']}'),
            subtitle: Text('Avaliação: ${review['rating']} - Comentário: ${review['comment']}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceEvaluationDetailPage(review: review),
                  ),
                );
              },
              child: const Text('Avaliar'),
            ),
          );
        },
      ),
    );
  }
}
