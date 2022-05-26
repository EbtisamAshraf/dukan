
import 'package:dukan/constants/design_constants/sizes_manager.dart';
import 'package:dukan/constants/design_constants/styles_manager.dart';
import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'fonts_manager.dart';

class ThemeManager {

static  ThemeData lightTheme(){
    return ThemeData(
      // visualDensity: Platform.isIOS ? VisualDensity.comfortable : VisualDensity.compact ,
      primarySwatch:Colors.purple ,


      // main color
        primaryColor:  ColorsManager.primaryColor,
        primaryColorLight: ColorsManager.primaryColorLight,
        primaryColorDark:ColorsManager.primaryColorDark ,
        disabledColor: ColorsManager.gray,
        splashColor: ColorsManager.gray.withOpacity(0.5),

        // card theme

        cardTheme: CardTheme(
          color: ColorsManager.white,
          shadowColor: ColorsManager.gray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizesManager.s12)),
        ),

        // text theme
        // textTheme: Typography.blackHelsinki,
        textTheme:  TextTheme(
          //login & register text
          headlineLarge:TextStylesManager.boldStyle(fontSize:FontSizeManager.s30,color: ColorsManager.black),
          // name of product in details screen
          headlineMedium: TextStylesManager.boldStyle(fontSize:FontSizeManager.s26,color: ColorsManager.black),
          // bold title
          headlineSmall:TextStylesManager.boldStyle(fontSize:FontSizeManager.s18,color: ColorsManager.black),
          // green text
          titleMedium:TextStylesManager.regularStyle(fontSize:FontSizeManager.s18,color: ColorsManager.primaryColor),
          titleSmall: TextStylesManager.regularStyle(fontSize:FontSizeManager.s16,color: ColorsManager.primaryColor),
          // email text and password && button
          displaySmall:  TextStylesManager.regularStyle(fontSize:FontSizeManager.s14,color: ColorsManager.black),
          displayMedium: TextStylesManager.regularStyle(fontSize:FontSizeManager.s18,color: ColorsManager.black),



          ),



        // appbar theme
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
          iconTheme: const IconThemeData(color:ColorsManager.black),
          titleTextStyle: TextStylesManager.semiBoldStyle(color: ColorsManager.black),
        ),

       // ButtonTheme  => style: Theme.of().ButtonThemeData
        buttonTheme: const ButtonThemeData(
          disabledColor: ColorsManager.gray,
          buttonColor:  ColorsManager.primaryColor,
          splashColor:  ColorsManager.primaryColorLight,
          shape: StadiumBorder(),
        ),

        // elevated ButtonTheme
          elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          textStyle:  TextStylesManager.regularStyle(fontSize:FontSizeManager.s14,color: ColorsManager.white),
            primary: ColorsManager.primaryColor,
            padding:  const EdgeInsets.symmetric(vertical: SizesManager.s16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizesManager.s5))
          )
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              padding:  const EdgeInsets.symmetric(vertical: SizesManager.s14),
              textStyle: TextStylesManager.mediumStyle(fontSize:FontSizeManager.s14,color: ColorsManager.black),
            )
          ),

        // input decoration Theme

        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(PaddingSizes.p10),
          hintStyle: TextStylesManager.regularStyle(color: ColorsManager.gray),
          labelStyle:  TextStylesManager.regularStyle(color: ColorsManager.black),
          errorStyle:  TextStylesManager.regularStyle(color: ColorsManager.red),


        ),
        // others
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
            backgroundColor: ColorsManager.primaryColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorsManager.primaryColor,
            elevation: 20.0,
            unselectedItemColor: ColorsManager.gray,
            backgroundColor: ColorsManager.white

        ));
  }





}