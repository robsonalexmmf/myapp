import 'package:flutter/material.dart';
import 'tax_management.dart';
import 'transfer_view.dart';
import 'service_management.dart';
import 'user_management.dart';
import 'subscription_management.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

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

  static final List<Widget> _pages = <Widget>[
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Gerenciar Impostos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaxManagementPage(),
                  ),
                );
              },
              child: const Text('Gerenciar Impostos'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Visualizar Transferências', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferViewPage(),
                  ),
                );
              },
              child: const Text('Visualizar Transferências'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Gerenciar Serviços', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceManagementPage(),
                  ),
                );
              },
              child: const Text('Gerenciar Serviços'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Gerenciar Usuários', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserManagementPage(),
                  ),
                );
              },
              child: const Text('Gerenciar Usuários'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Gerenciar Assinaturas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SubscriptionManagementPage(),
                  ),
                );
              },
              child: const Text('Gerenciar Assinaturas'),
            ),
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
