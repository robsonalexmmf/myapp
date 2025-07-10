import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Resumo Geral', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Total de usuários (proprietários e prestadores)'),
            trailing: const Text('0'), // Placeholder
          ),
          ListTile(
            leading: const Icon(Icons.build_circle),
            title: const Text('Total de serviços executados'),
            trailing: const Text('0'), // Placeholder
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text('Total arrecadado'),
            trailing: const Text('\$0.00'), // Placeholder
          ),
          ListTile(
            leading: const Icon(Icons.money_off),
            title: const Text('Total pago aos prestadores'),
            trailing: const Text('\$0.00'), // Placeholder
          ),
          ListTile(
            leading: const Icon(Icons.pending_actions),
            title: const Text('Serviços em andamento'),
            trailing: const Text('0'), // Placeholder
          ),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cadastro de Impostos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Lista e edição de impostos por estado'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Gerenciar Impostos'),
          ),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Transferências', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Histórico de transferências para prestadores'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Visualizar Transferências'),
          ),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Gestão de Serviços', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Visualização de todas as necessidades em aberto, em andamento ou finalizadas'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Gerenciar Serviços'),
          ),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Gestão de Usuários', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Lista de proprietários e prestadores'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Gerenciar Usuários'),
          ),
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Assinaturas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Usuários ativos nos planos Standard e Premium'),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Gerenciar Assinaturas'),
          ),
        ],
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.dashboard, 'Resumo'),
          _buildNavItem(Icons.account_balance, 'Impostos'),
          _buildNavItem(Icons.transfer_within_a_station, 'Transferências'),
          _buildNavItem(Icons.build_circle, 'Serviços'),
          _buildNavItem(Icons.group, 'Usuários'),
          _buildNavItem(Icons.subscriptions, 'Assinaturas'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
