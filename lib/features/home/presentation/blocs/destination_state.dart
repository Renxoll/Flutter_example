import 'package:example/features/home/domain/destination.dart';

abstract class DestinationState {

}

class DestinationInitialState extends DestinationState {
  
}
class DestinationLoadingState extends DestinationState {
  
}
class DestinationSuccessState extends DestinationState {
  final List<Destination> destinations;
  DestinationSuccessState(this.destinations); 
}

class DestinationFailureState extends DestinationState {
  final String message;
  DestinationFailureState({required this.message});
}