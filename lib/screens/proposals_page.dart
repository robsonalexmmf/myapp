import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'proposal_detail.dart';

class ProposalsPage extends StatelessWidget {
  const ProposalsPage({super.key});

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
            subtitle: Text('Valor: \$${(proposal['amount'] ?? 0.0).toStringAsFixed(2)} - Avaliação: ${proposal['rating']}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProposalDetailPage(proposal: proposal),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          );
        },
      ),
    );
  }
}
