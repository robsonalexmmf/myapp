import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum UserRole { owner, provider, admin }

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  UserRole? selectedRole;

  void _submit() {
    if (_formKey.currentState!.validate() && selectedRole != null) {
      _formKey.currentState!.save();
      // TODO: Authenticate user and navigate to respective dashboard
      String roleStr = selectedRole.toString().split('.').last;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login como \$roleStr (placeholder)')),
      );
      // Navigate to dashboard based on role
      switch (selectedRole) {
        case UserRole.owner:
          Navigator.pushReplacementNamed(context, '/ownerDashboard');
          break;
        case UserRole.provider:
          Navigator.pushReplacementNamed(context, '/providerDashboard');
          break;
        case UserRole.admin:
          Navigator.pushReplacementNamed(context, '/adminDashboard');
          break;
        default:
          break;
      }
    } else if (selectedRole == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecione o tipo de usuário')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
              DropdownButtonFormField<UserRole>(
                decoration: const InputDecoration(labelText: 'Tipo de Usuário'),
                items: UserRole.values
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role.toString().split('.').last),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Selecione o tipo de usuário' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
