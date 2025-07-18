import 'package:flutter/material.dart';
import 'screens/owner_registration.dart';
import 'screens/vehicle_registration.dart';
import 'screens/service_provider_registration.dart';
import 'screens/service_need_registration.dart';
import 'screens/service_need_list.dart';
import 'screens/login.dart';
import 'screens/owner_dashboard.dart';
import 'screens/provider_dashboard.dart';
import 'screens/admin_dashboard.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/owner_registration.dart';
import 'screens/vehicle_registration.dart';
import 'screens/service_provider_registration.dart';
import 'screens/service_need_registration.dart';
import 'screens/service_need_list.dart';
import 'screens/login.dart';
import 'screens/owner_dashboard.dart';
import 'screens/provider_dashboard.dart';
import 'screens/admin_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa o Firebase de forma assíncrona antes de rodar o app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Automotive Service App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        primaryColor: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 4,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/ownerDashboard': (context) => const OwnerDashboardPage(),
        '/providerDashboard': (context) => const ProviderDashboardPage(),
        '/adminDashboard': (context) => const AdminDashboardPage(),
        // Additional routes for owner
        '/ownerProfile': (context) => const PlaceholderScreen(title: 'Perfil do Proprietário'),
        '/vehicleManagement': (context) => const PlaceholderScreen(title: 'Gerenciamento de Veículos'),
        '/serviceNeeds': (context) => const PlaceholderScreen(title: 'Necessidades de Serviço'),
        '/proposals': (context) => const PlaceholderScreen(title: 'Propostas Recebidas'),
        '/serviceTracking': (context) => const PlaceholderScreen(title: 'Acompanhamento de Serviços'),
        '/serviceEvaluation': (context) => const PlaceholderScreen(title: 'Avaliação de Serviço'),
        '/subscriptionPlans': (context) => const PlaceholderScreen(title: 'Planos de Assinatura'),
        '/expenseReports': (context) => const PlaceholderScreen(title: 'Relatórios de Despesas'),
        // Additional routes for provider
        '/providerProfile': (context) => const PlaceholderScreen(title: 'Perfil do Prestador'),
        '/availableServices': (context) => const PlaceholderScreen(title: 'Serviços Disponíveis Próximos'),
        '/proposalsSent': (context) => const PlaceholderScreen(title: 'Propostas Enviadas'),
        '/serviceExecution': (context) => const PlaceholderScreen(title: 'Execução de Serviços'),
        '/earnings': (context) => const PlaceholderScreen(title: 'Valores Recebidos'),
        // Additional routes for admin
        '/taxSettings': (context) => const PlaceholderScreen(title: 'Cadastro e Parametrização de Impostos'),
        '/serviceReports': (context) => const PlaceholderScreen(title: 'Relatório de Serviços e Transferências'),
        '/paymentControl': (context) => const PlaceholderScreen(title: 'Controle de Pagamentos e Comissão'),
        '/reviewsAndComplaints': (context) => const PlaceholderScreen(title: 'Avaliações e Denúncias'),
        // Shared
        '/messages': (context) => const PlaceholderScreen(title: 'Central de Mensagens'),
      },
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Tela placeholder para \$title'),
      ),
    );
  }
}
