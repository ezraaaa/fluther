part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => null;
}

class LocationInitial extends LocationState {}

class LocationRequestInProgress extends LocationState {}

class LocationRequestSuccess extends LocationState {
  const LocationRequestSuccess(this.position);
  final Position position;

  @override
  List<Object> get props => <Position>[position];
}

class LocationRequestFailure extends LocationState {}
