import 'package:flutter/material.dart';
import '../mock_data.dart';

class ExpenseReportsPage extends StatelessWidget {
  const ExpenseReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = MockData.serviceNeeds; // Using serviceNeeds as mock for reports

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Despesas'),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ListTile(
            title: Text('Período: ${report['location']}'),
            subtitle: Text('Veículo: ${report['type']}'),
            trailing: const Text('Despesas: \$100.00'), // Mocked value
          );
        },
      ),
    );
  }
}
