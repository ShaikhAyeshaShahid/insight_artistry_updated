import 'package:insight_artistry_updated/domain/entities/ProductDetail.dart';
import 'package:insight_artistry_updated/domain/repositories/repo.dart';

import '../../constant/logger.dart';

class ProductListUsecase {
  final InsightArtistryRepo repository;

  ProductListUsecase( this.repository);

  Future<List<ProductDetail>> getProductList() async {
    try {
      return await repository.getProductList();
    } on Exception catch (e) {
      LogManager.error("usecase::productList::exception =", e);
      throw Exception(e.toString().substring(11));
    }
  }
}