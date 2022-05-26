import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());


  String? language  ;

  var locale = const Locale('en', 'EN');

  changeLanguage(value){
    language = value ;

    if(language == 'arabia'){
      locale =  const Locale('ar', 'AR');

    }
    if (language == 'english'){
      locale = const Locale('en', 'EN');
    }
    emit(ChangeLanguageState());
    return language;
  }
}
