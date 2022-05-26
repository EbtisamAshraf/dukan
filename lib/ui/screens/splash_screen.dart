import 'dart:async';
import 'package:dukan/constants/data_constants/assets_manager.dart';
import 'package:flutter/material.dart';
import '../../../routes.dart';
import '../../data/local_data/shared_preferences/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen( {Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startDelay();
  }

  startDelay() {
    timer = Timer(const Duration(seconds: 3), nextScreen);
  }

  nextScreen() {
   // bool? isSkip =  false;
   bool? isSkip =  SharedPref.getBoolData(key: 'isSkip') ; // todo changeIsSkip in nextButton
   String? token = SharedPref.getStringData(key: 'token');


    if(isSkip == true){

       if(token == null){
         Navigator.pushReplacementNamed(context, Routes.loginScreenRoute,);
       }
       else{
        Navigator.pushReplacementNamed(context, Routes.mainScreenRoute,  );
       }

    }else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute,  );
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.splash), fit: BoxFit.cover)),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
