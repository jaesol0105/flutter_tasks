import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/data/dto/todo_dto.dart';

/// 파이어스토어 CRUD 데이터 소스
abstract class FirestoreTodoDataSource {
  /// Todo 추가
  Future<TodoDTO> addTodo(TodoDTO todo);

  /// Todo 수정
  Future<void> updateTodo(TodoDTO todo);

  /// Todo 삭제
  Future<void> deleteTodo(String id);

  /// Todo 목록 조회
  Future<List<TodoDTO>> getTodos();
}

class FirestoreTodoDataSourceImpl implements FirestoreTodoDataSource {
  /// FirestoreTodoDataSource 구현체 (DIP 준수)
  FirestoreTodoDataSourceImpl({required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Future<TodoDTO> addTodo(TodoDTO todo) async {
    final ref = await firestore.collection('todo').add({
      ...todo.toJson(),
      'created_at': todo.createdAt ?? FieldValue.serverTimestamp(), // 파이어베이스 서버 시간 사용
    });
    return todo.copyWith(id: ref.id);
  }

  @override
  Future<void> updateTodo(TodoDTO todo) async {
    await firestore.collection('todo').doc(todo.id).update(todo.toJson());
  }

  @override
  Future<void> deleteTodo(String id) async {
    await firestore.collection('todo').doc(id).delete();
  }

  @override
  Future<List<TodoDTO>> getTodos() async {
    final snapshot = await firestore
        .collection('todo')
        .orderBy('created_at', descending: false) // 오래된 순 정렬
        .get();
    final documentSnapshots = snapshot.docs;
    return documentSnapshots.map((doc) => TodoDTO.fromJson({...doc.data(), 'id': doc.id})).toList();
  }
}
