import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/model/to_do_entity.dart';
import 'package:tasks/data/repository/to_do_repository.dart';

part 'to_do_repository_impl.g.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  ToDoRepositoryImpl({required this.firestore});

  final FirebaseFirestore firestore;

  @override
  Future<void> addToDo(ToDoEntity toDo) async {
    final json = toDo.toJson();
    // 서버 시간 사용
    json['created_at'] = toDo.createdAt ?? FieldValue.serverTimestamp();
    json['dead_line'] = toDo.deadLine != null ? Timestamp.fromDate(toDo.deadLine!) : null;
    await firestore.collection('todo').add(json);
  }

  @override
  Future<void> updateToDo(ToDoEntity toDo) async {
    final json = toDo.toJson();
    json['dead_line'] = toDo.deadLine != null ? Timestamp.fromDate(toDo.deadLine!) : null;
    await firestore.collection('todo').doc(toDo.id).update(json);
  }

  @override
  Future<void> deleteToDo(String id) async {
    await firestore.collection('todo').doc(id).delete();
  }

  Future<List<ToDoEntity>> getToDos() async {
    // 오래된 순 정렬
    final snapshot = await firestore.collection('todo').orderBy('created_at', descending: false).get();
    final documentSnaphots = snapshot.docs;
    return documentSnaphots.map((doc) => ToDoEntity.fromJson({...doc.data(), 'id': doc.id})).toList();
  }
}

/// [Repository Provider]
@riverpod
ToDoRepository toDoRepository(Ref ref) {
  // DI
  final firestore = FirebaseFirestore.instance;
  return ToDoRepositoryImpl(firestore: firestore);
}
