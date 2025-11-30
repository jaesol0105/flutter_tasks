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
