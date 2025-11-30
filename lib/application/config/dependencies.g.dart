// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firestoreTodoDataSource)
const firestoreTodoDataSourceProvider = FirestoreTodoDataSourceProvider._();

final class FirestoreTodoDataSourceProvider
    extends
        $FunctionalProvider<
          FirestoreTodoDataSource,
          FirestoreTodoDataSource,
          FirestoreTodoDataSource
        >
    with $Provider<FirestoreTodoDataSource> {
  const FirestoreTodoDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreTodoDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreTodoDataSourceHash();

  @$internal
  @override
  $ProviderElement<FirestoreTodoDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreTodoDataSource create(Ref ref) {
    return firestoreTodoDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreTodoDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreTodoDataSource>(value),
    );
  }
}

String _$firestoreTodoDataSourceHash() =>
    r'1204e51afff0224ca8cb33d360dcb22769420938';

@ProviderFor(apiWeatherDataSource)
const apiWeatherDataSourceProvider = ApiWeatherDataSourceProvider._();

final class ApiWeatherDataSourceProvider
    extends
        $FunctionalProvider<
          ApiWeatherDataSource,
          ApiWeatherDataSource,
          ApiWeatherDataSource
        >
    with $Provider<ApiWeatherDataSource> {
  const ApiWeatherDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiWeatherDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiWeatherDataSourceHash();

  @$internal
  @override
  $ProviderElement<ApiWeatherDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ApiWeatherDataSource create(Ref ref) {
    return apiWeatherDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiWeatherDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiWeatherDataSource>(value),
    );
  }
}

String _$apiWeatherDataSourceHash() =>
    r'71c9068de55007364bea8dd7917bb10e2ca4f10a';

@ProviderFor(todoRepository)
const todoRepositoryProvider = TodoRepositoryProvider._();

final class TodoRepositoryProvider
    extends $FunctionalProvider<TodoRepository, TodoRepository, TodoRepository>
    with $Provider<TodoRepository> {
  const TodoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoRepositoryHash();

  @$internal
  @override
  $ProviderElement<TodoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TodoRepository create(Ref ref) {
    return todoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoRepository>(value),
    );
  }
}

String _$todoRepositoryHash() => r'192507257ba5a8f5fc7d5d3ba0822389db34d17b';

@ProviderFor(weatherRepository)
const weatherRepositoryProvider = WeatherRepositoryProvider._();

final class WeatherRepositoryProvider
    extends
        $FunctionalProvider<
          WeatherRepository,
          WeatherRepository,
          WeatherRepository
        >
    with $Provider<WeatherRepository> {
  const WeatherRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherRepositoryHash();

  @$internal
  @override
  $ProviderElement<WeatherRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeatherRepository create(Ref ref) {
    return weatherRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherRepository>(value),
    );
  }
}

String _$weatherRepositoryHash() => r'17196ec9af5cf0b15058dfb72798dfc8d6984509';
