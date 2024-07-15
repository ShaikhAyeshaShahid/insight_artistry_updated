part of 'product_bloc.dart';

class ProductState extends Equatable {
  final ProductStatus productStatus;
  final List<ProductsModel> productList;
  final String message;

  ProductState({
    this.productStatus = ProductStatus.loading,
    this.productList = const <ProductsModel>[],
    this.message = '',
  });

  ProductState copyWith(
      {ProductStatus? productStatus,
      List<ProductsModel>? productList,
      String? message}) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      productList: productList ?? this.productList,
      message: message ?? this.message,
    );
  }
  @override
  List<Object> get props => [];h
}

final class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
