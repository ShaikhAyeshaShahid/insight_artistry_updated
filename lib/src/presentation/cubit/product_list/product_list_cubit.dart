import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insight_artistry_updated/domain/entities/ProductDetail.dart';

import '../../../../domain/usecase/product_list.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductListUsecase usecase;
  ProductListCubit(this.usecase) : super(ProductListInitial());

  void productList() async {
    try {
      emit(ProductListLoading());
      List<ProductDetail> productList = await usecase.getProductList();
      emit(ProductListSuccess(productList: productList));
    } on Exception catch (e) {
      emit(ProductListFailure(errorMessage: e.toString().substring(11)));
      throw Exception(e.toString().substring(11));
    }
  }
}
