import 'package:flutter/material.dart';

class ProviderDashboardPage extends StatefulWidget {
  const ProviderDashboardPage({Key? key}) : super(key: key);

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
          const Text('Meus Serviços', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Vincular aos serviços que realiza (checkbox)'),
          const Text('Se escolher "Buscar ou Levar Carro", mostrar opção:'),
          const Text('✅ Capacidade de diagnosticar problemas no veículo'),
          const SizedBox(height: 20),
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
      child: ListView(
        children: [
          const Text('Necessidades Próximas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Lista filtrada por raio de geolocalização'),
          const Text('Ver detalhes da necessidade'),
          const Text('Enviar proposta com valor menor que a anterior'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Visualizar Necessidades'),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Minhas Propostas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Ver status: enviada, aceita, recusada'),
          const Text('Ver histórico'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Visualizar Propostas'),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Execução do Serviço', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Preencher informações obrigatórias por tipo de serviço:'),
          const Text('Upload de fotos (traseira, painel, internas, etc.)'),
          const Text('Confirmação de geolocalização'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Gerenciar Execução'),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Ganhos', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Ver valores recebidos por serviço'),
          const Text('Status de pagamento (pendente, pago)'),
          const Text('Relatório de transferências'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Visualizar Ganhos'),
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
          const Text('Chat com o proprietário com tradução automática'),
          const Text('Envio de fotos e vídeos'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Abrir Central de Mensagens'),
          ),
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text('Avaliações Recebidas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('Ver nota e comentários deixados pelos proprietários'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Visualizar Avaliações'),
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
          ElevatedButton(
            onPressed: () {
              // TODO: Implementar funcionalidade
            },
            child: const Text('Editar Perfil'),
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
