import 'dart:io';
import 'package:example/features/home/domain/destination.dart';
import 'package:example/features/home/presentation/blocs/destination_bloc.dart'; 
import 'package:example/features/home/presentation/blocs/destination_events.dart'; 
import 'package:example/features/home/presentation/blocs/destination_state.dart'; 
import 'package:example/features/home/presentation/destination_card.dart';
import 'package:example/features/home/presentation/destination_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'media_category_filter.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MediaCategoryFilter _selectedFilter = MediaCategoryFilter.all;

  @override
  void initState() {
    super.initState();
    _loadDestinations(MediaCategoryFilter.all.value);
  }

  void _loadDestinations(String mediaCategory) {
    context.read<DestinationBloc>().add(
      GetDestinationsByMediaCategory(mediaCategory: mediaCategory),
    );
  }
  
  void _onFilterSelected(MediaCategoryFilter filter) {
    setState(() {
      _selectedFilter = filter;
    });
    _loadDestinations(filter.value);
  }


  @override
  Widget build(BuildContext context) {
    final List<MediaCategoryFilter> filters = [
      MediaCategoryFilter.all,
      MediaCategoryFilter.video,
      MediaCategoryFilter.image,
    ];

    return Column(
      children: [
        SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final filter = filters[index];
                return FilterChip(
                  label: Text(filter.displayName),
                  selected: _selectedFilter == filter,
                  onSelected: (bool selected) {
                    if (selected) {
                      _onFilterSelected(filter);
                    }
                  },
                );
              },
            ),
          ),
        ),
        
        Expanded(
          child: BlocBuilder<DestinationBloc, DestinationState>(
            builder: (context, state) {
              if (state is DestinationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is DestinationFailureState) {
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state is DestinationSuccessState) {
                final destinations = state.destinations;

                if (destinations.isEmpty) {
                  return const Center(
                    child: Text('No se encontraron destinos para esta categoría.'),
                  );
                }

                return ListView.builder(
                  itemCount: destinations.length,
                  itemBuilder: (context, index) {
                    Destination destination = destinations[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailPage(destination: destination),
                          ),
                        );
                      },
                      child: DestinationCard(destination: destination),
                    );
                  },
                );
              }
              
              return const Center(child: Text('Selecciona una categoría o espera la carga inicial.'));
            },
          ),
        ),
      ],
    );
  }
}