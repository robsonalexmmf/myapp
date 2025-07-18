import 'package:flutter/material.dart';

class ServiceNeedRegistrationPage extends StatefulWidget {
  const ServiceNeedRegistrationPage({super.key});

  @override
  _ServiceNeedRegistrationPageState createState() => _ServiceNeedRegistrationPageState();
}

class _ServiceNeedRegistrationPageState extends State<ServiceNeedRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String serviceType = '';
  String description = '';
  // Placeholder for geolocation and photos
  // TODO: Implement geolocation and photo upload

  final List<String> serviceTypes = [
    'Entregar Carro',
    'Buscar Carro',
    'Lavagem Expressa',
    'Lavagem Completa',
    'Troca de óleo e filtro',
    'Serviços mecânicos',
    'Guincho',
    'Diagnóstico de problemas',
  ];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Call backend API to register service need
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Necessidade registrada (placeholder)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Necessidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Tipo de Serviço'),
                items: serviceTypes
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    serviceType = value ?? '';
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Selecione o tipo de serviço' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                onSaved: (value) => description = value ?? '',
              ),
              const SizedBox(height: 20),
              // TODO: Add geolocation widget
              // TODO: Add photo upload widget
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Registrar Necessidade'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
