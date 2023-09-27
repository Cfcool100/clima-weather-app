import 'package:geolocator/geolocator.dart';

class Location {
  // Location({
  //   this.long,
  //   this.lat,
  // });

  late double long;
  late double lat;

  Future<void> getCurrentLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      lat = position.latitude;
      long = position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }
}
