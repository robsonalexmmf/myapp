import 'package:flutter/material.dart';

class ProposalDetailPage extends StatelessWidget {
  final Map<String, dynamic> proposal;

  const ProposalDetailPage({Key? key, required this.proposal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Proposta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prestador: ${proposal['providerName']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Valor: \$${(proposal['amount'] ?? 0.0).toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Avaliação: ${proposal['rating']}'),
            const SizedBox(height: 8),
            // Adicione mais campos conforme necessário
            ElevatedButton(
              onPressed: () {
                // TODO: Confirmar execução do serviço
              },
              child: const Text('Confirmar Execução'),
            ),
          ],
        ),
      ),
    );
  }
}
