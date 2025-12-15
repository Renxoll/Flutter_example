import 'package:example/features/home/data/destination_service.dart';
import 'package:example/features/home/domain/destination.dart';
import 'package:example/features/home/presentation/destination_card.dart';
import 'package:example/features/home/presentation/destination_detail_page.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget{
  const ShowPage({super.key});

  @override
  State<ShowPage> createState() => _ShowPageState();
  
}

class _ShowPageState extends State<ShowPage> {
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
      _isLoading = true; 
      _error = null;
    });

    try {
      final destinations = await DestinationService().getDestinations();
      setState(() {
        _destinations = destinations;
      });
    } catch (e) {
      setState(() {
        _error = 'Error al cargar los datos: $e';
      });
    } finally {
      setState(() {
        _isLoading = false; 
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

    return Column(
      children: [
        Row(
          children: [
            FilterChip(label: Text('Spot'), onSelected:(value) => {})
          ],
        ),
            Expanded(
              child: ListView.builder(
                itemCount: _destinations.length,
                itemBuilder: (context, index) {
                  Destination destination = _destinations[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) =>
                          DestinationDetailPage(destination: destination),
                          ),
                      );
                    },
                child: DestinationCard(destination: destination));
              },
            ),
          ),
        ],
    );
  }
}