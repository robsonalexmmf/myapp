import 'package:flutter/material.dart';

class ServiceProviderRegistrationPage extends StatefulWidget {
  const ServiceProviderRegistrationPage({super.key});

  @override
  _ServiceProviderRegistrationPageState createState() => _ServiceProviderRegistrationPageState();
}

class _ServiceProviderRegistrationPageState extends State<ServiceProviderRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  List<String> services = [];
  bool canDiagnoseVehicle = false;

  final List<String> availableServices = [
    'Entregar Carro 🚗',
    'Buscar Carro 🚕',
    'Lavagem Expressa 🧼',
    'Lavagem Completa 🛁',
    'Troca de óleo e filtro 🛢️',
    'Serviços mecânicos 🔧',
    'Guincho 🚨',
    'Diagnóstico de problemas 🩺',
  ];

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Call backend API to register service provider
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prestador registrado (placeholder)')),
      );
    }
  }

  Widget _buildServiceCheckbox(String service) {
    return CheckboxListTile(
      title: Row(
        children: [
          Text(service),
          const SizedBox(width: 8),
          if (service == 'Entregar Carro 🚗' || service == 'Buscar Carro 🚕')
            const Text('🛠️', style: TextStyle(fontSize: 18)),
        ],
      ),
      value: services.contains(service),
      onChanged: (bool? value) {
        setState(() {
          if (value == true) {
            services.add(service);
          } else {
            services.remove(service);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Prestador de Serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => name = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || !value.contains('@') ? 'Email inválido' : null,
                onSaved: (value) => email = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.length < 6 ? 'Senha muito curta' : null,
                onSaved: (value) => password = value ?? '',
              ),
              const SizedBox(height: 20),
              const Text('Serviços que realiza:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...availableServices.map(_buildServiceCheckbox),
              if (services.contains('Buscar Carro') || services.contains('Entregar Carro'))
                CheckboxListTile(
                  title: const Text('Capacidade de diagnosticar problemas no veículo'),
                  value: canDiagnoseVehicle,
                  onChanged: (bool? value) {
                    setState(() {
                      canDiagnoseVehicle = value ?? false;
                    });
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.person_add),
                  SizedBox(width: 8),
                  Text('Registrar Prestador'),
                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
