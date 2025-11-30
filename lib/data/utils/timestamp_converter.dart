import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore Timestamp와 DateTime 간 변환 컨버터
class TimestampConverter {
  /// Timestamp를 DateTime으로 변환
  static DateTime? toDateTime(dynamic timestamp) {
    if (timestamp == null) return null;
    if (timestamp is! Timestamp) return null;
    return timestamp.toDate();
  }

  /// DateTime을 Timestamp로 변환
  static Timestamp? toTimestamp(DateTime? dateTime) {
    if (dateTime == null) return null;
    return Timestamp.fromDate(dateTime);
  }
}
