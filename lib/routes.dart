import 'package:dukan/ui/screens/authentication%20_screen/login_screen.dart';
import 'package:dukan/ui/screens/authentication%20_screen/register_screen.dart';
import 'package:dukan/ui/screens/category_details_screen.dart';
import 'package:dukan/ui/screens/favorites_screen.dart';
import 'package:dukan/ui/screens/main_screen.dart';
import 'package:dukan/ui/screens/onboarding_screens/on_boarding_screen.dart';
import 'package:dukan/ui/screens/product_details_screen.dart';
import 'package:dukan/ui/screens/search_products_screen.dart';
import 'package:dukan/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'constants/data_constants/strings_manager.dart';
import 'data/model/arguments_model/category_details_arguments_model.dart';


class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainScreenRoute = "/main";
  static const String loginScreenRoute = "/login";
  static const String registerScreenRoute = "/register";
  static const String productDetailsScreenRoute = "/productDetails";
  static const String categoryDetailsScreenRoute = "/categoryDetails";
  static const String searchProductsScreenRoute = "/searchProducts";
  static const String favoritesScreenRoute = "/favorites";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>  const SplashScreen());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) =>  OnBoardingScreen());

      case Routes.mainScreenRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.loginScreenRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());

      case Routes.registerScreenRoute:
        return MaterialPageRoute(builder: (_) =>   RegisterScreen());

      case Routes.productDetailsScreenRoute:
        int? productDetailsArguments = settings.arguments as int?;

        return MaterialPageRoute(builder: (_) =>   ProductDetailsScreen(id:productDetailsArguments,));

      case Routes.categoryDetailsScreenRoute:
        CategoryDetailsArgumentsModel categoryDetailsArguments = settings.arguments as CategoryDetailsArgumentsModel;

        return MaterialPageRoute(builder: (_) =>   CategoryDetailsScreen(
            id: categoryDetailsArguments.id,
            categoryName: categoryDetailsArguments.categoryName));

      case Routes.searchProductsScreenRoute:
        return MaterialPageRoute(builder: (_) =>   SearchProductsScreen());

      case Routes.favoritesScreenRoute:
        return MaterialPageRoute(builder: (_) =>   FavoritesScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: const Text(StringsManager.noRouteFound),
          ),
          body: const Center(child: Text(StringsManager.noRouteFound)),
        ));
  }
}