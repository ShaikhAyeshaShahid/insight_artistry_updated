part of 'product_list_cubit.dart';

sealed class ProductListState extends Equatable {
  const ProductListState();
}

final class ProductListInitial extends ProductListState {
  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {
  @override
  List<Object> get props => [];
}

class ProductListSuccess extends ProductListState {
  @override
  final List<ProductDetail> productList;

  const ProductListSuccess({required this.productList});

  List<Object> get props => [];
}

class ProductListFailure extends ProductListState {
  final String errorMessage;

  const ProductListFailure({required this.errorMessage});

  @override
  List<Object> get props => [];
}
