import 'package:cached_network_image/cached_network_image.dart';
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
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(8), 
              topRight: Radius.circular(8)
              ),
            child: Hero(
              tag: destination.title,
              child: CachedNetworkImage(
                imageUrl: destination.url ?? 'Imagen no disponible',
                height: 120,
                width: 100,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return const Icon(Icons.broken_image, size: 64);
                },
              ),
            ),
          ),
          Text(destination.title, style: TextStyle(fontWeight: FontWeight.bold)
          ),
        ],
      ),
    );
  }
}
