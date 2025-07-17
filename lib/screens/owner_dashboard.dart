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
  const OwnerDashboardPage({Key? key}) : super(key: key);

  @override
  State<OwnerDashboardPage> createState() => _OwnerDashboardPageState();
}

class _OwnerDashboardPageState extends State<OwnerDashboardPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.directions_car, color: Colors.teal, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Meus Veículos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Cadastro, edição e remoção de veículos'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VehicleManagementPage(),
                          ),
                        );
                      },
                      child: const Text('Gerenciar Veículos'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.build, color: Colors.orange, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Minhas Necessidades', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Criar nova necessidade de serviço com geolocalização e tipo de serviço'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServiceNeedListPage(),
                          ),
                        );
                      },
                      child: const Text('Gerenciar Necessidades'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.gavel, color: Colors.purple, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Propostas Recebidas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Leilão invertido: ver propostas dos prestadores com valores decrescentes'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProposalsPage(),
                          ),
                        );
                      },
                      child: const Text('Visualizar Propostas'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.payment, color: Colors.green, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Pagamento', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Vincular cartão de crédito (Stripe)'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentManagementPage(),
                          ),
                        );
                      },
                      child: const Text('Gerenciar Pagamentos'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.rate_review, color: Colors.blue, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Avaliar Serviço', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Avaliar o serviço após finalizado'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServiceEvaluationPage(),
                          ),
                        );
                      },
                      child: const Text('Avaliar Serviço'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.receipt_long, color: Colors.brown, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Relatório de Despesas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Relatório por período e por veículo'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpenseReportsPage(),
                          ),
                        );
                      },
                      child: const Text('Visualizar Relatórios'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.subscriptions, color: Colors.deepPurple, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Assinatura', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Ver plano atual (Standard ou Premium)'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubscriptionManagementPage(),
                          ),
                        );
                      },
                      child: const Text('Gerenciar Assinatura'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.message, color: Colors.tealAccent, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Mensagens', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Chat com prestadores com tradução automática'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MessageCenterPage(),
                          ),
                        );
                      },
                      child: const Text('Abrir Central de Mensagens'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.person, color: Colors.pinkAccent, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Perfil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Text('Alterar dados pessoais e senha'),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileEditPage(),
                          ),
                        );
                      },
                      child: const Text('Editar Perfil'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
+
+    // Add placeholder pages for other tabs to avoid RangeError
+    for (int i = _pages.length; i < 9; i++) {
+      _pages.add(
+        Center(
+          child: Text('Página $i - Em desenvolvimento', style: const TextStyle(fontSize: 24)),
+        ),
+      );

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
        title: const Text('Dashboard Proprietário'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _pages.elementAt(_selectedIndex),
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
}
