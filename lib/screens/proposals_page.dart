import 'package:flutter/material.dart';
import '../mock_data.dart';

class ProposalsPage extends StatelessWidget {
  const ProposalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final proposals = MockData.proposals;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Propostas Recebidas'),
      ),
      body: ListView.builder(
        itemCount: proposals.length,
        itemBuilder: (context, index) {
          final proposal = proposals[index];
          return ListTile(
            title: Text('Prestador: ${proposal['providerName']}'),
            subtitle: Text('Valor: \$${proposal['amount'].toStringAsFixed(2)} - Avaliação: ${proposal['rating']}'),
            trailing: ElevatedButton(
              onPressed: () {
                // TODO: Confirmar execução do serviço
              },
              child: const Text('Confirmar'),
            ),
          );
        },
      ),
    );
  }
}
