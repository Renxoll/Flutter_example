import 'package:example/features/home/domain/destination.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination});
  final Destination destination;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(
          destination.url ?? '', 
          width: 64,
          fit: BoxFit.cover,
           errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image, size: 64);
          },
        ),
          Text(destination.title),
        ],
      ),
    );
  }
}
