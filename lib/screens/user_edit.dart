import 'package:flutter/material.dart';

class UserEditPage extends StatefulWidget {
  final Map<String, dynamic>? user;

  const UserEditPage({Key? key, this.user}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _email;
  late String _role;

  @override
  void initState() {
    super.initState();
    _name = widget.user?['name'] ?? '';
    _email = widget.user?['email'] ?? '';
    _role = widget.user?['role'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Novo Usuário' : 'Editar Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _name = value ?? '',
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value == null || !value.contains('@') ? 'Email inválido' : null,
                onSaved: (value) => _email = value ?? '',
              ),
              TextFormField(
                initialValue: _role,
                decoration: const InputDecoration(labelText: 'Função'),
                validator: (value) => value == null || value.isEmpty ? 'Informe a função' : null,
                onSaved: (value) => _role = value ?? '',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    // TODO: Salvar usuário
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuário salvo com sucesso')),
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
