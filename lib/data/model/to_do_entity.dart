import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_entity.freezed.dart';
part 'to_do_entity.g.dart';

@freezed
abstract class ToDoEntity with _$ToDoEntity {
  const factory ToDoEntity({
    required String id,
    required String title,
    String? description,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'is_done') required bool isDone,
    @JsonKey(
      name: 'created_at',
      fromJson: _convertToDateTime,
      toJson: _convertToTimestamp,
    )
    DateTime? createdAt,
    @JsonKey(fromJson: _convertToDateTime, toJson: _convertToTimestamp)
    DateTime? due, // deadLine으로 rename 하기
  }) = _ToDoEntity;

  factory ToDoEntity.fromJson(Map<String, dynamic> json) =>
      _$ToDoEntityFromJson(json);
}

// Timestamp to DateTime 컨버터
DateTime? _convertToDateTime(dynamic time) {
  if (time == null) return null;
  return time.toDate();
}

// DateTime to Timestamp 컨버터
Object? _convertToTimestamp(DateTime? date) {
  if (date == null) return null;
  return Timestamp.fromDate(date);
}
