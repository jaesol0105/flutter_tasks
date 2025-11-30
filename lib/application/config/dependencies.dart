import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

// 임포트 순서 DataSourse -> Repository -> Usecase 순서로
import 'package:tasks/data/data_sources/firestore_todo_data_source.dart';
import 'package:tasks/data/data_sources/api_weather_data_source.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';

part 'dependencies.g.dart';

@riverpod
FirestoreTodoDataSource firestoreTodoDataSource(Ref ref) {
  final firestore = FirebaseFirestore.instance; // DI
  return FirestoreTodoDataSourceImpl(firestore: firestore);
}

@Riverpod(keepAlive: true) // client 계속 닫혀서 keepAlive
ApiWeatherDataSource apiWeatherDataSource(Ref ref) {
  final client = http.Client(); // DI
  ref.onDispose(client.close); // 앱 종료시 정리
  return ApiWeatherDataSourceImpl(client: client);
}

@riverpod
TodoRepository todoRepository(Ref ref) {
  final dataSource = ref.watch(firestoreTodoDataSourceProvider);
  return TodoRepositoryImpl(dataSource: dataSource);
}
