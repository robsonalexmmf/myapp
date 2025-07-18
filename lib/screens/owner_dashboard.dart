import 'package:flutter/material.dart';
import 'vehicle_management.dart';
import 'service_need_list.dart';
import 'proposals_page.dart';
import 'payment_management.dart';
import 'service_evaluation.dart';
import 'expense_reports.dart';
import 'subscription_management.dart';
import 'message_center.dart';
import 'profile_edit.dart';

class OwnerDashboardPage extends StatefulWidget {
  const OwnerDashboardPage({super.key});

  @override
  State<OwnerDashboardPage> createState() => _OwnerDashboardPageState();
}

class _OwnerDashboardPageState extends State<OwnerDashboardPage> {
  int _selectedIndex = 0;

  Widget _buildVehicleManagementSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _buildSection(
            icon: Icons.directions_car,
            iconColor: Colors.teal,
            title: 'Meus Veículos 🚗',
            description: 'Cadastro, edição e remoção de veículos 🛠️',
            buttonText: 'Gerenciar Veículos',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VehicleManagementPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.build,
            iconColor: Colors.orange,
            title: 'Minhas Necessidades 🛎️',
            description: 'Criar nova necessidade de serviço com geolocalização e tipo de serviço 📍',
            buttonText: 'Gerenciar Necessidades',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceNeedListPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.gavel,
            iconColor: Colors.purple,
            title: 'Propostas Recebidas 📑',
            description: 'Leilão invertido: ver propostas dos prestadores com valores decrescentes 📉',
            buttonText: 'Visualizar Propostas',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProposalsPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.payment,
            iconColor: Colors.green,
            title: 'Pagamento 💳',
            description: 'Vincular cartão de crédito (Stripe) 💰',
            buttonText: 'Gerenciar Pagamentos',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentManagementPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.rate_review,
            iconColor: Colors.blue,
            title: 'Avaliar Serviço ⭐',
            description: 'Avaliar o serviço após finalizado 📝',
            buttonText: 'Avaliar Serviço',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServiceEvaluationPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.receipt_long,
            iconColor: Colors.brown,
            title: 'Relatório de Despesas 📊',
            description: 'Relatório por período e por veículo 📅',
            buttonText: 'Visualizar Relatórios',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExpenseReportsPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.subscriptions,
            iconColor: Colors.deepPurple,
            title: 'Assinatura 📜',
            description: 'Ver plano atual (Standard ou Premium) 🏷️',
            buttonText: 'Gerenciar Assinatura',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SubscriptionManagementPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.message,
            iconColor: Colors.tealAccent,
            title: 'Mensagens 💬',
            description: 'Chat com prestadores com tradução automática 🌐',
            buttonText: 'Abrir Central de Mensagens',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessageCenterPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          _buildSection(
            icon: Icons.person,
            iconColor: Colors.pinkAccent,
            title: 'Perfil 👤',
            description: 'Alterar dados pessoais e senha 🔒',
            buttonText: 'Editar Perfil',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileEditPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Text(description),
          ),
          const SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return _buildVehicleManagementSection();
      case 1:
        return const ServiceNeedListPage();
      case 2:
        return const ProposalsPage();
      case 3:
        return const PaymentManagementPage();
      case 4:
        return const ServiceEvaluationPage();
      case 5:
        return const ExpenseReportsPage();
      case 6:
        return const SubscriptionManagementPage();
      case 7:
        return const MessageCenterPage();
      case 8:
        return const ProfileEditPage();
      default:
        return Center(
          child: Text('Página $index - Em desenvolvimento', style: const TextStyle(fontSize: 24)),
        );
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Proprietário'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: List.generate(9, (index) => _buildPage(index)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.directions_car, 'Veículos'),
          _buildNavItem(Icons.build, 'Necessidades'),
          _buildNavItem(Icons.gavel, 'Propostas'),
          _buildNavItem(Icons.payment, 'Pagamento'),
          _buildNavItem(Icons.rate_review, 'Avaliar'),
          _buildNavItem(Icons.receipt_long, 'Relatórios'),
          _buildNavItem(Icons.subscriptions, 'Assinatura'),
          _buildNavItem(Icons.message, 'Mensagens'),
          _buildNavItem(Icons.person, 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
