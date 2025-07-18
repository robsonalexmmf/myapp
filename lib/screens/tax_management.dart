import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'tax_edit.dart';

class TaxManagementPage extends StatelessWidget {
  const TaxManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taxes = MockData.taxes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Impostos'),
      ),
      body: ListView.builder(
        itemCount: taxes.length,
        itemBuilder: (context, index) {
          final tax = taxes[index];
          return ListTile(
            title: Text('Estado: ${tax['state']}'),
            subtitle: Text('Taxa: ${tax['rate']}%'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaxEditPage(tax: tax),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
