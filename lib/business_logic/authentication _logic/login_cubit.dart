import 'dart:developer';
import 'package:dukan/data/apis/authentication_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/authentication_model/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  late final LoginModel loginModel;

  userLogin({required String email, required String password}) {
    emit(LoginLoadingState());
    AuthenticationApi.userLogin(email: email, password: password).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      log(loginModel.message.toString());
      emit(LoginLoadedState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      log(error.toString());
    });
  }

  bool isPasswordVisible = false;
  changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }
}
