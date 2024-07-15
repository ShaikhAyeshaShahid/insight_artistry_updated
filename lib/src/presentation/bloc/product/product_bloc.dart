import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insight_artistry_updated/domain/entities/product/ProductsModel.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../../domain/repositories/product_repo.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository = ProductRepository();

  ProductBloc() : super(ProductState()) {
    on<ProductFetched>(fetchProduct);
  }

  void fetchProduct(ProductFetched event, Emitter<ProductState> emit) async {
    await productRepository.Product().then((value) {
      emit(state.copyWith(
          productStatus: ProductStatus.success,
          message: 'success',
          productList: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          productStatus: ProductStatus.failure, message: error.toString()));
    });
  }
}
