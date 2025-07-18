import 'package:flutter/material.dart';

class TaxEditPage extends StatefulWidget {
  final Map<String, dynamic>? tax;

  const TaxEditPage({super.key, this.tax});

  @override
  State<TaxEditPage> createState() => _TaxEditPageState();
}

class _TaxEditPageState extends State<TaxEditPage> {
  final _formKey = GlobalKey<FormState>();
  late String _state;
  late double _rate;

  @override
  void initState() {
    super.initState();
    _state = widget.tax?['state'] ?? '';
    _rate = widget.tax?['rate']?.toDouble() ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tax == null ? 'Novo Imposto' : 'Editar Imposto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _state,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o estado' : null,
                onSaved: (value) => _state = value ?? '',
              ),
              TextFormField(
                initialValue: _rate.toString(),
                decoration: const InputDecoration(labelText: 'Taxa (%)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a taxa';
                  final parsed = double.tryParse(value);
                  if (parsed == null) return 'Informe um número válido';
                  return null;
                },
                onSaved: (value) => _rate = double.parse(value ?? '0'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // TODO: Salvar imposto
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Imposto salvo com sucesso')),
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
