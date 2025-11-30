import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasks/data/utils/timestamp_converter.dart';

part 'todo_dto.freezed.dart';
part 'todo_dto.g.dart';

@freezed
abstract class TodoDTO with _$TodoDTO {
  const factory TodoDTO({
    required String id,
    required String title,
    String? description,
    @JsonKey(name: 'is_favorite') required bool isFavorite,
    @JsonKey(name: 'is_done') required bool isDone,
    @JsonKey(
      name: 'created_at',
      fromJson: TimestampConverter.toDateTime,
      toJson: TimestampConverter.toTimestamp,
    )
    DateTime? createdAt,
    @JsonKey(
      name: 'dead_line',
      fromJson: TimestampConverter.toDateTime,
      toJson: TimestampConverter.toTimestamp,
    )
    DateTime? deadLine,
  }) = _TodoDTO;

  factory TodoDTO.fromJson(Map<String, dynamic> json) => _$TodoDTOFromJson(json);
}
