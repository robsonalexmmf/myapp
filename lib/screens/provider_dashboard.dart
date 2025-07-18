import 'package:flutter/material.dart';
import 'service_management.dart';
import 'service_need_list.dart';
import 'proposals_page.dart';
import 'payment_management.dart';
import 'message_center.dart';
import 'service_evaluation.dart';
import 'profile_edit.dart';

class ProviderDashboardPage extends StatefulWidget {
  const ProviderDashboardPage({super.key});

  @override
  State<ProviderDashboardPage> createState() => _ProviderDashboardPageState();
}

class _ProviderDashboardPageState extends State<ProviderDashboardPage> {
  int _selectedIndex = 0;

    static final List<Widget> _pages = <Widget>[
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.build, color: Colors.blue),
            title: const Text('Meus Serviços', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('🔧', style: TextStyle(fontSize: 20)),
            title: const Text('Vincular aos serviços que realiza (checkbox)'),
          ),
          ListTile(
            leading: const Text('🚗', style: TextStyle(fontSize: 20)),
            title: const Text('Se escolher "Buscar ou Levar Carro", mostrar opção:'),
          ),
          ListTile(
            leading: const Text('✅', style: TextStyle(fontSize: 20)),
            title: const Text('Capacidade de diagnosticar problemas no veículo'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              label: const Text('Gerenciar Serviços'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.red),
            title: const Text('Necessidades Próximas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('📍', style: TextStyle(fontSize: 20)),
            title: const Text('Lista filtrada por raio de geolocalização'),
          ),
          ListTile(
            leading: const Text('🔎', style: TextStyle(fontSize: 20)),
            title: const Text('Ver detalhes da necessidade'),
          ),
          ListTile(
            leading: const Text('💰', style: TextStyle(fontSize: 20)),
            title: const Text('Enviar proposta com valor menor que a anterior'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceNeedListPage(),
                  ),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text('Visualizar Necessidades'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.gavel, color: Colors.orange),
            title: const Text('Minhas Propostas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('📄', style: TextStyle(fontSize: 20)),
            title: const Text('Ver status: enviada, aceita, recusada'),
          ),
          ListTile(
            leading: const Text('📜', style: TextStyle(fontSize: 20)),
            title: const Text('Ver histórico'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProposalsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.visibility),
              label: const Text('Visualizar Propostas'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.flag, color: Colors.green),
            title: const Text('Execução do Serviço', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('📝', style: TextStyle(fontSize: 20)),
            title: const Text('Preencher informações obrigatórias por tipo de serviço:'),
          ),
          ListTile(
            leading: const Text('📷', style: TextStyle(fontSize: 20)),
            title: const Text('Upload de fotos (traseira, painel, internas, etc.)'),
          ),
          ListTile(
            leading: const Text('📍', style: TextStyle(fontSize: 20)),
            title: const Text('Confirmação de geolocalização'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.build_circle),
              label: const Text('Gerenciar Execução'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.attach_money, color: Colors.greenAccent),
            title: const Text('Ganhos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('💵', style: TextStyle(fontSize: 20)),
            title: const Text('Ver valores recebidos por serviço'),
          ),
          ListTile(
            leading: const Text('📅', style: TextStyle(fontSize: 20)),
            title: const Text('Status de pagamento (pendente, pago)'),
          ),
          ListTile(
            leading: const Text('📊', style: TextStyle(fontSize: 20)),
            title: const Text('Relatório de transferências'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentManagementPage(),
                  ),
                );
              },
              icon: const Icon(Icons.receipt_long),
              label: const Text('Visualizar Ganhos'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.message, color: Colors.blueAccent),
            title: const Text('Mensagens', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('💬', style: TextStyle(fontSize: 20)),
            title: const Text('Chat com o proprietário com tradução automática'),
          ),
          ListTile(
            leading: const Text('📸', style: TextStyle(fontSize: 20)),
            title: const Text('Envio de fotos e vídeos'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MessageCenterPage(),
                  ),
                );
              },
              icon: const Icon(Icons.chat),
              label: const Text('Abrir Central de Mensagens'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.rate_review, color: Colors.purple),
            title: const Text('Avaliações Recebidas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('⭐', style: TextStyle(fontSize: 20)),
            title: const Text('Ver nota e comentários deixados pelos proprietários'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ServiceEvaluationPage(),
                  ),
                );
              },
              icon: const Icon(Icons.visibility),
              label: const Text('Visualizar Avaliações'),
            ),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.teal),
            title: const Text('Perfil', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          ListTile(
            leading: const Text('👤', style: TextStyle(fontSize: 20)),
            title: const Text('Alterar dados pessoais e senha'),
          ),
          ListTile(
            leading: const Text('🌐', style: TextStyle(fontSize: 20)),
            title: const Text('Preferência de idioma'),
          ),
          const SizedBox(height: 20),
          Builder(
            builder: (context) => ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileEditPage(),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Editar Perfil'),
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
        title: const Text('Dashboard Prestador'),
        centerTitle: true,
        elevation: 8,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildNavItem(Icons.build, 'Serviços'),
          _buildNavItem(Icons.location_on, 'Necessidades'),
          _buildNavItem(Icons.gavel, 'Propostas'),
          _buildNavItem(Icons.flag, 'Execução'),
          _buildNavItem(Icons.attach_money, 'Ganhos'),
          _buildNavItem(Icons.message, 'Mensagens'),
          _buildNavItem(Icons.rate_review, 'Avaliações'),
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
