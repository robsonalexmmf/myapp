import 'package:flutter/material.dart';

class VehicleRegistrationPage extends StatefulWidget {
  const VehicleRegistrationPage({Key? key}) : super(key: key);

  @override
  _VehicleRegistrationPageState createState() => _VehicleRegistrationPageState();
}

class _VehicleRegistrationPageState extends State<VehicleRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String brand = '';
  String model = '';
  String licensePlate = '';
  String year = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Call backend API to register vehicle
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veículo registrado (placeholder)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Marca'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a marca' : null,
                onSaved: (value) => brand = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Modelo'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o modelo' : null,
                onSaved: (value) => model = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Placa'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe a placa' : null,
                onSaved: (value) => licensePlate = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o ano';
                  }
                  final yearNum = int.tryParse(value);
                  if (yearNum == null || yearNum < 1900 || yearNum > DateTime.now().year) {
                    return 'Ano inválido';
                  }
                  return null;
                },
                onSaved: (value) => year = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Registrar Veículo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
