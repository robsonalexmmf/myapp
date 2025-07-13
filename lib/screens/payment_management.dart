import 'package:flutter/material.dart';
import '../mock_data.dart';

class PaymentManagementPage extends StatelessWidget {
  const PaymentManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final payments = MockData.payments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Pagamentos'),
      ),
      body: ListView.builder(
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return ListTile(
            title: Text('Serviço: ${payment['service']}'),
            subtitle: Text('Data: ${payment['date']}'),
            trailing: Text('\$${payment['amount'].toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
