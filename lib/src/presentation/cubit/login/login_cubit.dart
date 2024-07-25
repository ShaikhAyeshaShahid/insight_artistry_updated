import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insight_artistry_updated/constant/logger.dart';

import '../../../../domain/usecase/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase usecase;

  LoginCubit(this.usecase) : super(LoginInitial());

  void login({String? email, String? password}) async {
    try {
      emit(LoginLoading());
      await usecase.login(email: email, password: password);
      LogManager.info('cubit::login');
      emit(LoginSuccess());
    } on Exception catch (e) {
      LogManager.error('cubit::logiin::exception=', e);
      emit(LoginFailed(errorMessage: e.toString().substring(11)));
    }
  }
}
