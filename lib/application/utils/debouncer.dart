import 'dart:async';

class Debouncer {
  Debouncer({required this.duration, required this.callback});

  // 디바운싱 시간을 설정할 Duration
  final Duration duration;
  // 디바운싱 시간 카운팅할 객체
  Timer? _timer;
  // 시간이 되면 실행될 함수
  void Function() callback;

  // run 메서드를 실행시켜
  // Duration 후 callback이 실행되는 Timer 객체 생성
  // 기존 타이머가 시간 카운팅 중이면 cancel
  void run() {
    _timer?.cancel();
    _timer = Timer(duration, () {
      callback();
    });
  }

  // 위젯이 화면에서 사라질 때를 대비하여 타이머를 중지시키는 메서드
  void dispose() {
    _timer?.cancel();
  }
}
