import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? myLongitude;
  double? myLatitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permisson = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      myLongitude = position.longitude;
      myLatitude = position.latitude;
      print(position);
    } catch (e) {
      print('위치 정보수신에 문제가 생겼습니다.');
    }
  }
}
