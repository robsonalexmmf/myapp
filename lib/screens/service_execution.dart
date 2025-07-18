import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ServiceExecutionPage extends StatefulWidget {
  const ServiceExecutionPage({super.key});

  @override
  State<ServiceExecutionPage> createState() => _ServiceExecutionPageState();
}

class _ServiceExecutionPageState extends State<ServiceExecutionPage> {
  final ImagePicker _picker = ImagePicker();
  File? rearPhoto;
  File? dashboardPhoto;
  File? exteriorPhoto;
  File? interiorPhoto;
  bool geolocationConfirmed = false;

  Future<void> _pickImage(ImageSource source, String photoType) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image == null) return;
    setState(() {
      switch (photoType) {
        case 'rear':
          rearPhoto = File(image.path);
          break;
        case 'dashboard':
          dashboardPhoto = File(image.path);
          break;
        case 'exterior':
          exteriorPhoto = File(image.path);
          break;
        case 'interior':
          interiorPhoto = File(image.path);
          break;
      }
    });
  }

  void _confirmGeolocation() {
    // Placeholder for geolocation confirmation logic
    setState(() {
      geolocationConfirmed = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Geolocalização confirmada 📍')),
    );
  }

  void _submitExecution() {
    if (!geolocationConfirmed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, confirme a geolocalização antes de enviar')),
      );
      return;
    }
    // TODO: Implement submission logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Execução do serviço enviada com sucesso! 🎉')),
    );
  }

  Widget _buildPhotoPicker(String label, File? photo, String photoType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label 📷', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera, photoType),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Tirar Foto'),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery, photoType),
              icon: const Icon(Icons.photo_library),
              label: const Text('Selecionar da Galeria'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (photo != null)
          Image.file(photo, width: 150, height: 100, fit: BoxFit.cover),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Execução do Serviço 🛠️'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildPhotoPicker('Foto Traseira do Carro', rearPhoto, 'rear'),
            _buildPhotoPicker('Foto do Painel de Instrumentos', dashboardPhoto, 'dashboard'),
            _buildPhotoPicker('Foto Externa', exteriorPhoto, 'exterior'),
            _buildPhotoPicker('Foto Interna', interiorPhoto, 'interior'),
            ElevatedButton.icon(
              onPressed: _confirmGeolocation,
              icon: const Icon(Icons.location_on),
              label: Text(geolocationConfirmed ? 'Geolocalização Confirmada ✅' : 'Confirmar Geolocalização 📍'),
              style: ElevatedButton.styleFrom(
                backgroundColor: geolocationConfirmed ? Colors.green : null,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: _submitExecution,
                icon: const Icon(Icons.send),
                label: const Text('Enviar Execução'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
