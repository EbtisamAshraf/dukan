import 'dart:developer';

import 'package:dukan/data/apis/authentication_api.dart';
import 'package:dukan/data/model/authentication_model/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) =>BlocProvider.of(context);


  late final RegisterModel registerModel;

  userRegister({required String email, required String password ,required String name ,required String phone }){
    emit(RegisterLoadingState());

    AuthenticationApi.userRegister(email: email, password: password, name: name, phone: phone).then((value) {
      registerModel= RegisterModel.fromJson(value.data);
      log(registerModel.message.toString());
      emit(RegisterLoadedState(registerModel));
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
      log(error.toString());
    });
  }

  bool isPasswordVisible = false;
  changePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }
}
