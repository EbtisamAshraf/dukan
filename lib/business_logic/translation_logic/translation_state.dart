part of 'translation_cubit.dart';

@immutable
abstract class TranslationState {}

class TranslationInitial extends TranslationState {}
class ChangeLanguageState extends TranslationState {}

