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
            const Text('Meus Veículos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Cadastro, edição e remoção de veículos'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Minhas Necessidades', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Criar nova necessidade de serviço com geolocalização e tipo de serviço'),
            const Text('Campos dinâmicos por tipo de serviço (ex: fotos, local de entrega)'),
            const Text('Listar necessidades abertas, em andamento ou concluídas'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Propostas Recebidas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Leilão invertido: ver propostas dos prestadores com valores decrescentes'),
            const Text('Ver perfil e avaliação de prestadores'),
            const Text('Confirmar execução do serviço'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Pagamento', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Vincular cartão de crédito (Stripe)'),
            const Text('Ver fatura do serviço (valor + comissão + imposto)'),
            const Text('Histórico de pagamentos'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Avaliar Serviço', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Avaliar o serviço após finalizado'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Relatório de Despesas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Relatório por período e por veículo'),
            const Text('Exportar como PDF ou Excel (se possível)'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Assinatura', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Ver plano atual (Standard ou Premium)'),
            const Text('Assinar ou trocar plano (via Stripe)'),
            const Text('Ver histórico de cobrança'),
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
                child: const Text('Gerenciar Assinatura'),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Mensagens', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Chat com prestadores com tradução automática'),
            const Text('Envio de fotos e vídeos'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
      Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Perfil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Alterar dados pessoais e senha'),
            const Text('Preferência de idioma'),
            const SizedBox(height: 20),
            Builder(
              builder: (context) => ElevatedButton(
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
