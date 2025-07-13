import 'package:flutter/material.dart';
import '../mock_data.dart';

class TransferViewPage extends StatelessWidget {
  const TransferViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transfers = MockData.transfers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Transferências'),
      ),
      body: ListView.builder(
        itemCount: transfers.length,
        itemBuilder: (context, index) {
          final transfer = transfers[index];
          return ListTile(
            title: Text('Prestador: ${transfer['providerName']}'),
            subtitle: Text('Data: ${transfer['date']}'),
            trailing: Text('\$${transfer['amount'].toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
