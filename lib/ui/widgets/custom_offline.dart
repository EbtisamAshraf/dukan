import 'package:dukan/constants/data_constants/assets_manager.dart';
import 'package:dukan/constants/design_constants/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';

class CustomOffline extends StatelessWidget {
  const CustomOffline({Key? key, required this.onLineChild}) : super(key: key);

  final Widget onLineChild;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        return connected ? onLineChild: SafeArea(child: Column(
          children: [
            Container(
              color:ColorsManager.red ,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: const Text('No internet',style: TextStyle(fontSize: 20,color: ColorsManager.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,) ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset(ImageAssets.noConnection),
            ),
            const Spacer(),
          ],
        )) ;
      },
      child:const Center(
        child: Text(''),
      ),

    );
  }
}
