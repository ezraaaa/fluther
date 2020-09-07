import 'package:geolocator/geolocator.dart';

class LocationRepository {
  Future<Position> fetchUserLocation() async {
    final Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    return position;
  }
}
