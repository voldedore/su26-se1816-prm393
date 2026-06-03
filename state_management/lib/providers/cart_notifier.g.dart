// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/*********************** GENERATOR *******************/

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

/*********************** GENERATOR *******************/
final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, List<Product>> {
  /*********************** GENERATOR *******************/
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: false,
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

String _$cartNotifierHash() => r'0379c3cd0dd2904a93f8ee05c6611471e543ce06';

/*********************** GENERATOR *******************/

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
