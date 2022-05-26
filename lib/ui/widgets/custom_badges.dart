import 'package:dukan/constants/design_constants/colors_manager.dart';
import 'package:flutter/material.dart';

class CustomBadges extends StatelessWidget {
  const CustomBadges({Key? key,required this.child,required this.badgeContent}) : super(key: key);
 final Widget child;
 final int badgeContent;

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        child,
        PositionedDirectional(
          top: 3,
          end: 6,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: ColorsManager.red,
              shape: BoxShape.circle
            ),

            child:  Text('$badgeContent',style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
