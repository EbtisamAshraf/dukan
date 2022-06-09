import 'package:dukan/constants/design_constants/theme_manager.dart';
import 'package:dukan/data/local_data/shared_preferences/shared_pref.dart';
import 'package:dukan/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/app_logic/app_cubit.dart';
import 'business_logic/app_logic/app_state.dart';
import 'constants/data_constants/strings_manager.dart';
import 'data/apis/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await SharedPref.init();
  StringsManager.token = SharedPref.getStringData(key: 'token')!;

  runApp(EasyLocalization(
    child: const MyApp(),
    path: 'assets/translation',
    supportedLocales: const [
      Locale('en', 'EN'),
      Locale('ar', 'AR'),
    ],
    saveLocale: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
            title: 'Dukan',
            theme: ThemeManager.lightTheme(),
          );
        },
      ),
    );
  }
}


