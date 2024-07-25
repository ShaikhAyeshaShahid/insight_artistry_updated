import 'package:insight_artistry_updated/constant/network_utils.dart';
import 'package:insight_artistry_updated/domain/repositories/repo.dart';

import '../../constant/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class InsightArtistyRepositoryImpl extends InsightArtistryRepo {
  @override
  Future login({String? email, String? password}) async {
    try {
      var url = Uri.parse('${NetworkUtils.baseUrl}/login');
      LogManager.info('repository::login::url = $url');
      String jsonBody = jsonEncode({
        'email': email,
        'password': password,
      });

      LogManager.info('repository::login::jsonBody = $jsonBody');

      http.Response response = await http.post(url, body: jsonBody);

      var responseBody = jsonDecode(response.body);

      /*if (responseBody['code'] != 'DAO_SUCCESS_00') {
        throw Exception(responseBody['message']);
      }*/

    } on Exception catch (e) {
      LogManager.error('repository::login::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }

}