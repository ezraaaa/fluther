import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluther/repositories/location/location_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({@required this.locationRepository})
      : assert(locationRepository != null),
        super(LocationInitial());

  final LocationRepository locationRepository;

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationPermissionRequested) {
      yield* _mapLocationPermissionRequestedToState();
    }
  }

  Stream<LocationState> _mapLocationPermissionRequestedToState() async* {
    yield LocationRequestInProgress();
    try {
      final Position position = await locationRepository.fetchUserLocation();
      yield LocationRequestSuccess(position);
    } catch (error) {
      print(error);
      yield LocationRequestFailure();
    }
  }
}
