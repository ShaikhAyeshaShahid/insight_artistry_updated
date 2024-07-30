import 'package:insight_artistry_updated/domain/entities/ProductDetail.dart';
import 'package:insight_artistry_updated/src/presentation/views/product_display_screen/product_display_screen.dart';

abstract class InsightArtistryRepo{
  Future login({String? email, String? password});
  Future<List<ProductDetail>> getProductList();

}