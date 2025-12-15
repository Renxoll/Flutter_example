import 'package:cached_network_image/cached_network_image.dart';
import 'package:example/features/home/domain/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Hero(
          tag: destination.title,
          child: CachedNetworkImage(
            imageUrl: destination.url ?? 'https://via.placeholder.com/150',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(destination.title)
        ],
      )
    );
  }
}