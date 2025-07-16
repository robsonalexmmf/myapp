import 'package:flutter/material.dart';

class VehicleEditPage extends StatefulWidget {
  final Map<String, dynamic>? vehicle;

  const VehicleEditPage({Key? key, this.vehicle}) : super(key: key);

  @override
  State<VehicleEditPage> createState() => _VehicleEditPageState();
}

class _VehicleEditPageState extends State<VehicleEditPage> {
  final _formKey = GlobalKey<FormState>();
  late String _brand;
  late String _model;
  late String _plate;
  late String _year;

  @override
  void initState() {
    super.initState();
    _brand = widget.vehicle?['brand'] ?? '';
    _model = widget.vehicle?['model'] ?? '';
    _plate = widget.vehicle?['plate'] ?? '';
    _year = widget.vehicle?['year'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vehicle == null ? 'Novo Veículo' : 'Editar Veículo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _brand,
                decoration: const InputDecoration(labelText: 'Marca'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a marca' : null,
                onSaved: (value) => _brand = value ?? '',
              ),
              TextFormField(
                initialValue: _model,
                decoration: const InputDecoration(labelText: 'Modelo'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o modelo' : null,
                onSaved: (value) => _model = value ?? '',
              ),
              TextFormField(
                initialValue: _plate,
                decoration: const InputDecoration(labelText: 'Placa'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a placa' : null,
                onSaved: (value) => _plate = value ?? '',
              ),
              TextFormField(
                initialValue: _year,
                decoration: const InputDecoration(labelText: 'Ano'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o ano' : null,
                onSaved: (value) => _year = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // TODO: Salvar veículo
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Veículo salvo com sucesso')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
