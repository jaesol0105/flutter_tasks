// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Repository Provider

@ProviderFor(toDoRepository)
const toDoRepositoryProvider = ToDoRepositoryProvider._();

/// Repository Provider

final class ToDoRepositoryProvider
    extends $FunctionalProvider<ToDoRepository, ToDoRepository, ToDoRepository>
    with $Provider<ToDoRepository> {
  /// Repository Provider
  const ToDoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toDoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toDoRepositoryHash();

  @$internal
  @override
  $ProviderElement<ToDoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToDoRepository create(Ref ref) {
    return toDoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToDoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToDoRepository>(value),
    );
  }
}

String _$toDoRepositoryHash() => r'c6ffa5ad0fbbbea9a8a6d8c8e9f8312f44fcac43';
