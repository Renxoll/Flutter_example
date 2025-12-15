// Archivo: destination_service.dart (Modificado)

import 'dart:convert';
import 'dart:io';

import 'package:example/features/home/domain/destination.dart';
import 'package:http/http.dart' as http;

class DestinationService {
  final String _baseUrl = "https://api.nasa.gov/planetary/apod?api_key=cqsp022dPCefD5wayXEexTzybe3IlxwABIeZANgh&start_date=2017-07-08&end_date=2017-12-10";

  List<Destination>? _cachedDestinations; 

  Future<List<Destination>> getDestinations(String mediaCategory) async { 
    if (_cachedDestinations == null) {
      _cachedDestinations = await _fetchDestinationsFromApi();
    }
    
    if (mediaCategory.toLowerCase() == 'all') {
      return _cachedDestinations!;
    } else {
      final filteredList = _cachedDestinations!
          .where((destination) => destination.mediaCategory.toLowerCase() == mediaCategory.toLowerCase())
          .toList();
          
      return filteredList;
    }
  }

  Future<List<Destination>> _fetchDestinationsFromApi() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == HttpStatus.ok) {
      final List maps = jsonDecode(response.body);
      
      // Mapea y devuelve toda la lista
      return maps.map((json) => Destination.fromJson(json)).toList();      
    } else {
      throw Exception('Fallo la carga de destinos. Status: ${response.statusCode}');
    }
  }
}