// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomePageViewModel)
const homePageViewModelProvider = HomePageViewModelProvider._();

final class HomePageViewModelProvider
    extends $AsyncNotifierProvider<HomePageViewModel, List<ToDoEntity>> {
  const HomePageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePageViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePageViewModelHash();

  @$internal
  @override
  HomePageViewModel create() => HomePageViewModel();
}

String _$homePageViewModelHash() => r'23828478c63434720acc4784dcb8df4bc9a24812';

abstract class _$HomePageViewModel extends $AsyncNotifier<List<ToDoEntity>> {
  FutureOr<List<ToDoEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ToDoEntity>>, List<ToDoEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ToDoEntity>>, List<ToDoEntity>>,
              AsyncValue<List<ToDoEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
