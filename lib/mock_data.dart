class MockData {
  static List<Map<String, dynamic>> services = [
    {
      'id': 1,
      'name': 'Buscar Carro',
      'description': 'Serviço de buscar carro com fotos e geolocalização',
    },
    {
      'id': 2,
      'name': 'Lavagem Expressa',
      'description': 'Lavagem rápida do veículo',
    },
  ];

  static List<Map<String, dynamic>> serviceNeeds = [
    {
      'id': 1,
      'type': 'Buscar Carro',
      'location': '123 Main St, City, State',
      'status': 'Aberto',
    },
    {
      'id': 2,
      'type': 'Lavagem Expressa',
      'location': '456 Elm St, City, State',
      'status': 'Em andamento',
    },
  ];

  static List<Map<String, dynamic>> proposals = [
    {
      'id': 1,
      'serviceNeedId': 1,
      'providerName': 'João Silva',
      'value': 100.0,
      'status': 'Enviada',
    },
    {
      'id': 2,
      'serviceNeedId': 2,
      'providerName': 'Maria Souza',
      'value': 50.0,
      'status': 'Aceita',
    },
  ];

  static List<Map<String, dynamic>> executions = [
    {
      'id': 1,
      'serviceNeedId': 1,
      'status': 'Em execução',
      'photos': ['photo1.jpg', 'photo2.jpg'],
      'locationConfirmed': true,
    },
  ];

  static List<Map<String, dynamic>> earnings = [
    {
      'id': 1,
      'serviceId': 1,
      'amount': 120.0,
      'status': 'Pago',
    },
  ];

  static List<Map<String, dynamic>> messages = [
    {
      'id': 1,
      'from': 'Proprietário',
      'to': 'Prestador',
      'content': 'Olá, gostaria de agendar o serviço.',
      'translatedContent': {
        'en': 'Hello, I would like to schedule the service.',
        'es': 'Hola, me gustaría programar el servicio.',
      },
    },
  ];

  static List<Map<String, dynamic>> reviews = [
    {
      'id': 1,
      'providerName': 'João Silva',
      'rating': 4.5,
      'comment': 'Serviço excelente!',
    },
  ];

  static List<Map<String, dynamic>> vehicles = [
    {
      'id': 1,
      'brand': 'Toyota',
      'model': 'Corolla',
      'plate': 'ABC-1234',
      'year': 2018,
    },
  ];

  static List<Map<String, dynamic>> payments = [
    {
      'id': 1,
      'serviceId': 1,
      'amount': 120.0,
      'date': '2024-06-01',
      'status': 'Pago',
    },
  ];

  static List<Map<String, dynamic>> subscriptions = [
    {
      'id': 1,
      'userId': 1,
      'plan': 'Standard',
      'status': 'Ativo',
      'startDate': '2024-01-01',
      'endDate': '2024-12-31',
    },
  ];

  static List<Map<String, dynamic>> users = [
    {
      'id': 1,
      'name': 'João Silva',
      'role': 'Proprietário',
      'email': 'joao@example.com',
    },
    {
      'id': 2,
      'name': 'Maria Souza',
      'role': 'Prestador',
      'email': 'maria@example.com',
    },
  ];

  static List<Map<String, dynamic>> taxes = [
    {
      'id': 1,
      'state': 'CA',
      'rate': 7.25,
    },
  ];

  static List<Map<String, dynamic>> transfers = [
    {
      'id': 1,
      'providerName': 'Maria Souza',
      'amount': 100.0,
      'date': '2024-06-05',
    },
  ];
}
