// test/data/repositories/todo_repository_impl_test.dart
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasks/data/data_sources/firestore_todo_data_source.dart';
import 'package:tasks/data/data_sources/firestore_todo_data_source.dart'
    show FirestoreTodoDataSourceImpl;
import 'package:tasks/data/mappers/todo_mapper.dart';
import 'package:tasks/data/repositories/todo_repository_impl.dart';
import 'package:tasks/domain/entities/todo_entity.dart';
import 'package:tasks/domain/repositories/todo_repository.dart';

void main() {
  /// 누군가가 31초만에 만들어 준 테스트 코드 All tests passed!
  group('[TodoRepositoryTest]', () {
    late FakeFirebaseFirestore fakeFirestore;
    late FirestoreTodoDataSource dataSource;
    late TodoRepository repository;

    setUp(() {
      print('[TodoRepositoryTest] ----------------------------');
      print('[TodoRepositoryTest] setUp: FakeFirebaseFirestore 초기화');

      fakeFirestore = FakeFirebaseFirestore();
      dataSource = FirestoreTodoDataSourceImpl(firestore: fakeFirestore);
      repository = TodoRepositoryImpl(dataSource: dataSource);
    });

    tearDown(() async {
      final snapshot = await fakeFirestore.collection('todo').get();
      print('[TodoRepositoryTest] tearDown: 현재 todos 문서 수 = ${snapshot.docs.length}');
    });

    test('addTodo should create a document', () async {
      print('[TodoRepositoryTest] === [TEST] addTodo should create a document 시작 ===');

      // 1) 현재 컬렉션 상태 확인
      final before = await fakeFirestore.collection('todo').get();
      print('[TodoRepositoryTest] 1) addTodo 호출 전, todos 컬렉션 상태 확인');
      print('[TodoRepositoryTest]   -> 기존 문서 수 : ${before.docs.length}');
      expect(before.docs.length, 0);

      // 2) repository.addTodo() 호출
      print('[TodoRepositoryTest] 2) repository.addTodo() 호출');

      final newTodo = TodoEntity(
        id: 'dummy-id', // 이거 안들어가고 Firestore에서 새 id가 부여됨
        title: 'Test',
        description: '',
        isFavorite: false,
        isDone: false,
        createdAt: DateTime.parse('2025-11-18T19:51:22.673422'),
        deadLine: null,
      );

      final added = await repository.addTodo(newTodo);

      // 3) Firestore에 실제로 문서가 생성됐는지 확인
      print('[TodoRepositoryTest] 3) Firestore todos 컬렉션 저장 결과 확인');
      final after = await fakeFirestore.collection('todo').get();
      print('[TodoRepositoryTest]   -> 저장 후 문서 수 : ${after.docs.length}');
      expect(after.docs.length, 1);

      final doc = after.docs.first;
      print('[TodoRepositoryTest]   -> 첫 번째 todo: id=${doc.id}, data=${doc.data()}');

      // id, 내용이 적절히 매핑되었는지 간단 확인
      expect(added.title, 'Test');
      expect(doc.data()['title'], 'Test');

      print('[TodoRepositoryTest] === [TEST] addTodo should create a document 종료 ===');
    });

    test('getTodos should return list of todos ordered by created_at asc', () async {
      print(
        '[TodoRepositoryTest] === [TEST] getTodos should return list of todos ordered by created_at asc 시작 ===',
      );

      // 1) FakeFirestore에 테스트용 문서 2개 삽입 (created_at 값 다르게)
      print('[TodoRepositoryTest] 1) Fake Firestore에 두 개의 todo 문서를 직접 삽입');
      final createdAt1 = DateTime.parse('2025-11-18T19:51:22.705586');
      final createdAt2 = DateTime.parse('2025-11-18T19:51:23.705586');

      final doc1 = await fakeFirestore.collection('todo').add({
        'title': 'A',
        'description': '',
        'is_favorite': false,
        'is_done': false,
        'created_at': createdAt1,
      });

      final doc2 = await fakeFirestore.collection('todo').add({
        'title': 'B',
        'description': '',
        'is_favorite': false,
        'is_done': false,
        'created_at': createdAt2,
      });

      print('[TodoRepositoryTest]   -> doc 1 삽입: id=${doc1.id}, title=A, created_at=$createdAt1');
      print('[TodoRepositoryTest]   -> doc 2 삽입: id=${doc2.id}, title=B, created_at=$createdAt2');

      // 2) repository.getTodos() 호출
      print('[TodoRepositoryTest] 2) repository.getTodos() 호출');
      final result = await repository.getTodos(limit: 10);
      print('[TodoRepositoryTest]   -> getTodos 결과 length : ${result.length}');
      expect(result.length, 2);

      print(
        '[TodoRepositoryTest]   -> 첫 번째 todo: id=${result[0].id}, title=${result[0].title}, createdAt=${result[0].createdAt}',
      );
      print(
        '[TodoRepositoryTest]   -> 두 번째 todo: id=${result[1].id}, title=${result[1].title}, createdAt=${result[1].createdAt}',
      );

      // created_at 오름차순인지 확인
      expect(result[0].title, 'A');
      expect(result[1].title, 'B');
      expect(result[0].createdAt!.isBefore(result[1].createdAt!), true);

      print(
        '[TodoRepositoryTest] === [TEST] getTodos should return list of todos ordered by created_at asc 종료 ===',
      );
    });

    test('deleteTodo removes the document', () async {
      print('[TodoRepositoryTest] === [TEST] deleteTodo removes the document 시작 ===');

      // 1) 삭제할 문서 1개 삽입
      print('[TodoRepositoryTest] 1) Fake Firestore에 todo 1개 삽입');
      final doc = await fakeFirestore.collection('todo').add({
        'title': 'DeleteTarget',
        'description': '',
        'is_favorite': false,
        'is_done': false,
        'created_at': DateTime.now(),
      });

      final before = await fakeFirestore.collection('todo').get();
      print('[TodoRepositoryTest]   -> 삭제 전 문서 수 : ${before.docs.length}');
      expect(before.docs.length, 1);

      // 2) repository.deleteTodo() 호출
      print('[TodoRepositoryTest] 2) repository.deleteTodo("${doc.id}") 호출');
      await repository.deleteTodo(doc.id);

      // 3) Firestore에서 실제로 삭제되었는지 확인
      print('[TodoRepositoryTest] 3) Firestore에서 문서 존재 여부 확인');
      final afterDoc = await fakeFirestore.collection('todo').doc(doc.id).get();
      print('[TodoRepositoryTest]   -> 삭제 후 doc.exists : ${afterDoc.exists}');
      expect(afterDoc.exists, false);

      final after = await fakeFirestore.collection('todo').get();
      print('[TodoRepositoryTest]   -> 삭제 후 todos 문서 수 : ${after.docs.length}');
      expect(after.docs.length, 0);

      print('[TodoRepositoryTest] === [TEST] deleteTodo removes the document 종료 ===');
    });
  });
}
