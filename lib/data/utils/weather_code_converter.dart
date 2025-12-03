/// Open-Meteo API Weather Code 컨버터
class WeatherCodeConverter {
  /// 날씨 코드를 한국어 내용으로 변환
  static String toDescription(num code) {
    final int c = code.toInt();
    if (c == 0) return '맑음';
    if ([1, 2, 3].contains(c)) return '흐림';
    if ([45, 48].contains(c)) return '안개';
    if ([51, 53, 55].contains(c)) return '이슬비';
    if ([56, 57].contains(c)) return '언 이슬비';
    if ([61, 63, 65].contains(c)) return '비';
    if ([66, 67].contains(c)) return '언 비';
    if ([71, 73, 75].contains(c)) return '눈';
    if (c == 77) return '눈송이';
    if ([80, 81, 82].contains(c)) return '소나기';
    if ([85, 86].contains(c)) return '눈 소나기';
    if (c == 95) return '천둥 번개';
    if ([96, 99].contains(c)) return '번개와 우박';
    return '알 수 없음';
  }
}
