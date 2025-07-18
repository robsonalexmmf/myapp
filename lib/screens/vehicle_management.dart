import 'package:flutter/material.dart';
import '../mock_data.dart';
import 'vehicle_edit.dart';

class VehicleManagementPage extends StatelessWidget {
  const VehicleManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicles = MockData.vehicles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Veículos'),
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return ListTile(
            title: Text('${vehicle['brand']} ${vehicle['model']}'),
            subtitle: Text('Placa: ${vehicle['plate']} - Ano: ${vehicle['year']}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VehicleEditPage(vehicle: vehicle),
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
