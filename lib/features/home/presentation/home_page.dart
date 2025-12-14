import 'package:example/destination.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {

    final List<Destination> destinations = [
      Destination(id: 1, title: "Paris", posterPath: "")
    ];
    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        Destination destination = destinations[index];
        return Text(destination.title);
      } 
    );
  }
}