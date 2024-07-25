import 'package:insight_artistry_updated/constant/logger.dart';
import 'package:insight_artistry_updated/domain/repositories/repo.dart';

class LoginUsecase {
  final InsightArtistryRepo repository;

  LoginUsecase({required this.repository});

  Future login({String? email, String? password}) async {
    try {
      LogManager.info("usecase::LoginUsecase::repository.login");

      return await repository.login(email: email, password: password);
    } on Exception catch (e) {
      LogManager.error("usecase::LoginUsecase::exception =", e);
      throw Exception(e.toString().substring(11));
    }
  }
}
