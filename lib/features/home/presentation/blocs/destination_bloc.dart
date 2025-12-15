import 'package:example/features/home/data/destination_service.dart';
import 'package:example/features/home/domain/destination.dart';
import 'package:example/features/home/presentation/blocs/destination_events.dart';
import 'package:example/features/home/presentation/blocs/destination_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationBloc extends  Bloc<DestinationEvents, DestinationState> {

  DestinationBloc() : super(DestinationInitialState()) {
    on<GetDestinationsByMediaCategory>((event, emit) async { 
      emit(DestinationLoadingState());
      try {
        List<Destination> destinations = await DestinationService().getDestinations(event.mediaCategory);
        
        emit(DestinationSuccessState(destinations)); 
      } catch (e) {
        emit(DestinationFailureState(message: e.toString()));
      }
    });
  } 
}