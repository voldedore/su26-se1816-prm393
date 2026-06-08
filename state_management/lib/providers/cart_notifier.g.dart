// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/*********************** GENERATOR *******************/
// @Riverpod(keepAlive: true)

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

/*********************** GENERATOR *******************/
// @Riverpod(keepAlive: true)
final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, List<Product>> {
  /*********************** GENERATOR *******************/
  // @Riverpod(keepAlive: true)
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Product> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Product>>(value),
    );
  }
}

String _$cartNotifierHash() => r'11e9d0fd84de707b8cc08f06fbb8988e60747671';

/*********************** GENERATOR *******************/
// @Riverpod(keepAlive: true)

abstract class _$CartNotifier extends $Notifier<List<Product>> {
  List<Product> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Product>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Product>, List<Product>>,
              List<Product>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(totalItems)
final totalItemsProvider = TotalItemsProvider._();

final class TotalItemsProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  TotalItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalItemsHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return totalItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$totalItemsHash() => r'03d31c2577ed908e86d5b3193234fce3ff40e616';
