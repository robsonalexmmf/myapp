import 'package:flutter/material.dart';
import 'tax_management.dart';
import 'transfer_view.dart';
import 'service_management.dart';
import 'user_management.dart';
import 'subscription_management.dart';
import 'profile_edit.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _selectedIndex = 0;

  late BuildContext _context;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _context = context;
  }

  List<Widget> get _pages {
    return [
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.account_balance, color: Colors.blue),
              title: const Text('Gerenciar Impostos 🧾', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Gerencie os impostos de forma eficiente e organizada 📊'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaxManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.account_balance_wallet),
              label: const Text('Gerenciar Impostos'),
            ),
            const SizedBox(height: 30),
            // Botão de logout removido conforme solicitado
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.swap_horiz, color: Colors.orange),
              title: const Text('Visualizar Transferências 🔄', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Acompanhe todas as transferências realizadas com segurança 💸'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferViewPage(),
                  ),
                );
              },
              icon: const Icon(Icons.swap_calls),
              label: const Text('Visualizar Transferências'),
            ),
            const SizedBox(height: 30),
            // Botão de logout removido conforme solicitado
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.build, color: Colors.green),
              title: const Text('Gerenciar Serviços 🛠️', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Administre os serviços oferecidos com facilidade ⚙️'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.build_circle),
              label: const Text('Gerenciar Serviços'),
            ),
            const SizedBox(height: 30),
            // Botão de logout removido conforme solicitado
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.group, color: Colors.purple),
              title: const Text('Gerenciar Usuários 👥', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Controle e gerencie os usuários do sistema com facilidade 👤'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.manage_accounts),
              label: const Text('Gerenciar Usuários'),
            ),
            const SizedBox(height: 30),
            // Botão de logout removido conforme solicitado
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.subscriptions, color: Colors.deepPurple),
              title: const Text('Gerenciar Assinaturas 📜', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Gerencie os planos de assinatura e seus benefícios 📋'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.subscriptions),
              label: const Text('Gerenciar Assinaturas'),
            ),
            const SizedBox(height: 30),
            // Botão de logout removido conforme solicitado
          ],
        ),
      ),
    ];
  }

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
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.person),
            onSelected: (value) {
              if (value == 'edit_profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileEditPage(),
                  ),
                );
              } else if (value == 'logout') {
                // Aqui você pode adicionar a lógica de logout, por exemplo, limpar tokens ou estado de autenticação
                // Depois redirecionar para a tela de login
                // Exemplo simples:
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'edit_profile',
                child: Row(
                  children: const [
                    Icon(Icons.edit, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Editar Perfil ✏️'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Logout 🚪'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.account_balance, 'Impostos'),
          _buildNavItem(Icons.swap_horiz, 'Transferências'),
          _buildNavItem(Icons.build, 'Serviços'),
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
