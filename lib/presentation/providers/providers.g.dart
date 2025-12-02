// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// [반응형 UI - 테블릿/폴드] 선택된 todo 상태관리 프로바이더

@ProviderFor(SelectedTodo)
const selectedTodoProvider = SelectedTodoProvider._();

/// [반응형 UI - 테블릿/폴드] 선택된 todo 상태관리 프로바이더
final class SelectedTodoProvider
    extends $NotifierProvider<SelectedTodo, TodoEntity?> {
  /// [반응형 UI - 테블릿/폴드] 선택된 todo 상태관리 프로바이더
  const SelectedTodoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedTodoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedTodoHash();

  @$internal
  @override
  SelectedTodo create() => SelectedTodo();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoEntity?>(value),
    );
  }
}

String _$selectedTodoHash() => r'5063e77ff27527965812e0d2c1db7b3a242fd327';

/// [반응형 UI - 테블릿/폴드] 선택된 todo 상태관리 프로바이더

abstract class _$SelectedTodo extends $Notifier<TodoEntity?> {
  TodoEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TodoEntity?, TodoEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodoEntity?, TodoEntity?>,
              TodoEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
