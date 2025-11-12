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
    final collectionRef = firestore.collection('todo');
    await collectionRef.add({
      'title': toDo.title,
      'description': toDo.description,
      'is_favorite': toDo.isFavorite,
      'is_done': toDo.isDone,
      'created_at': toDo.createdAt ?? FieldValue.serverTimestamp(), // 서버 시간
      'due': toDo.due != null ? Timestamp.fromDate(toDo.due!) : null,
    });
  }

  @override
  Future<void> updateToDo(ToDoEntity toDo) async {
    final documentRef = firestore.collection('todo').doc(toDo.id);
    await documentRef.update({
      'title': toDo.title,
      'description': toDo.description,
      'is_favorite': toDo.isFavorite,
      'is_done': toDo.isDone,
      'due': toDo.due != null ? Timestamp.fromDate(toDo.due!) : null,
    });
  }

  @override
  Future<void> deleteToDo(String id) async {
    await firestore.collection('todo').doc(id).delete();
  }

  @override
  Future<List<ToDoEntity>> getToDos() async {
    final collectionRef = firestore.collection('todo');
    // 오래된순 정렬
    final snapshot = await collectionRef
        .orderBy('created_at', descending: false)
        .get();
    final documentSnaphots = snapshot.docs;

    final list = documentSnaphots.map((doc) {
      final data = doc.data();
      final map = {'id': doc.id, ...data};
      return ToDoEntity.fromJson(map);
    }).toList();

    return list;
  }
}

/// [Repository Provider]
@riverpod
ToDoRepository toDoRepository(Ref ref) {
  final firestore = FirebaseFirestore.instance;
  return ToDoRepositoryImpl(firestore: firestore);
}
