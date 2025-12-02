// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoDetailViewModel)
const todoDetailViewModelProvider = TodoDetailViewModelFamily._();

final class TodoDetailViewModelProvider
    extends $NotifierProvider<TodoDetailViewModel, TodoDetailState> {
  const TodoDetailViewModelProvider._({
    required TodoDetailViewModelFamily super.from,
    required TodoEntity super.argument,
  }) : super(
         retry: null,
         name: r'todoDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$todoDetailViewModelHash();

  @override
  String toString() {
    return r'todoDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TodoDetailViewModel create() => TodoDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TodoDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todoDetailViewModelHash() =>
    r'c58418dc79d7d523a001e71db91b2118ee03ba69';

final class TodoDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          TodoDetailViewModel,
          TodoDetailState,
          TodoDetailState,
          TodoDetailState,
          TodoEntity
        > {
  const TodoDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'todoDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TodoDetailViewModelProvider call(TodoEntity todo) =>
      TodoDetailViewModelProvider._(argument: todo, from: this);

  @override
  String toString() => r'todoDetailViewModelProvider';
}

abstract class _$TodoDetailViewModel extends $Notifier<TodoDetailState> {
  late final _$args = ref.$arg as TodoEntity;
  TodoEntity get todo => _$args;

  TodoDetailState build(TodoEntity todo);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<TodoDetailState, TodoDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodoDetailState, TodoDetailState>,
              TodoDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
