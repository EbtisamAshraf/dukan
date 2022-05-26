import 'package:flutter/material.dart';
import '../../business_logic/app_logic/app_cubit.dart';
import '../../constants/design_constants/colors_manager.dart';

class CustomFavoritesIcon extends StatelessWidget {
  const CustomFavoritesIcon(
      {Key? key, required this.id, required this.iconData})
      : super(key: key);
  final int id;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AppCubit.get(context).addOrDeleteFavorite(id: id);
        },
        icon: CircleAvatar(
          backgroundColor: ColorsManager.white,
          child: Icon(
             iconData,
            color: ColorsManager.red,
          ),
        ));
  }
}
