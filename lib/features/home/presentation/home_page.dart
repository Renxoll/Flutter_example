import 'package:example/features/home/data/destination_service.dart';
import 'package:example/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<Destination> _destinations = [];
  bool _isLoading = true; 
  String? _error; 

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true; // Inicia la carga
      _error = null;
    });

    try {
      final destinations = await DestinationService().getDestinations();
      setState(() {
        _destinations = destinations;
      });
    } catch (e) {
      // Captura cualquier excepción que ocurra (p. ej., problemas de red)
      setState(() {
        _error = 'Error al cargar los datos: $e';
      });
    } finally {
      setState(() {
        _isLoading = false; // Finaliza la carga
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. Estado de Error
    if (_error != null) {
      return Center(
        child: Text(
          '¡Ups! $_error',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (_destinations.isEmpty) {
      return const Center(
        child: Text('No se encontraron destinos. Revisa el servicio.'),
      );
    }

    return ListView.builder(
      itemCount: _destinations.length,
      itemBuilder: (context, index) {
        Destination destination = _destinations[index];
        return ListTile(
          title: Text(destination.title),
          subtitle: Text(destination.explanation ?? 'Sin descripción'),
        );
      },
    );
  }
}