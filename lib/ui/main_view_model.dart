import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

//Position은 클래스 위치 정보를 나타내기 위한 클래스...
class Position {
  final double latitude; //초기값 설정
  final double longitude; //초기값 설정

  Position({required this.latitude, required this.longitude});
}

class MainViewModel extends ChangeNotifier {
  int _counter = 0;
  Position _currentPosition = Position(
      latitude: 0, longitude: 0); // _currentPosition 위치 정보로 초기값 (0,0)좌표로설정

  int get counter => _counter;
  Position get currentPosition => _currentPosition; //객체를 반환하는 getter

  void incrementCounter() {
    _counter++;
    notifyListeners(); // 카운터 값이 증가 할때마다 상태가 변경되는걸 호출한다.
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(); // 위치 정보를 가져온다.
      _currentPosition = position as Position; //성공적으로 위치를 가져오면 업데이트
      notifyListeners();
    } catch (e) {
      print('현재 위치를 가져오지 못했습니다: $e');
    }
  }
}
