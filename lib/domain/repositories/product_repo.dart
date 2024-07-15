import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:insight_artistry_updated/domain/entities/product/Dimensions.dart';
import 'package:insight_artistry_updated/domain/entities/product/ProductsModel.dart';
import 'package:insight_artistry_updated/domain/entities/product/Reviews.dart';

class ProductRepository {
  Future<List<ProductsModel>> Product() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) => ProductsModel.fromJson(e)).toList();
        /*(
            id: e['id'],
            title: e['title'],
            description: e['description'],
            category: e['category'],
            price: e['price'],
            discountPercentage: e['discountPercentage'],
            rating: e['rating'],
            stock: e['stock'],
            tags: List<String>.from(e['tags']),
            brand: e['brand'],
            sku: e['sku'],
            weight: e['weight'],
            dimensions: Dimensions.fromJson(e['dimensions']),
            warrantyInformation: e['warrantyInformation'],
            shippingInformation: e['shippingInformation'],
            availabilityStatus: e['availabilityStatus'],
            reviews: (json['reviews'] as List)
              .map((reviews)=>Reviews.fromJson(reviews))
              .toList(),
          );*/
      }
    } on SocketException {
      throw Exception('error while fetching data');
    } on TimeoutException {
      throw Exception('error while fetching data');
    }
    throw Exception('error while fetching data');
  }
}
