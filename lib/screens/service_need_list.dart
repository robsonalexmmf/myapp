import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'service_need_detail.dart';

class ServiceNeedListPage extends StatelessWidget {
  const ServiceNeedListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceNeeds = MockData.serviceNeeds;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Necessidades Próximas'),
      ),
      body: ListView.builder(
        itemCount: serviceNeeds.length,
        itemBuilder: (context, index) {
          final need = serviceNeeds[index];
          return ListTile(
            title: Text(need['type']),
            subtitle: Text('${need['location']} - Status: ${need['status']}'),
            trailing: ElevatedButton(
              child: const Text('Visualizar Necessidade'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceNeedDetailPage(need: need),
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
