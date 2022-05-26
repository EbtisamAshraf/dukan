import 'package:flutter/material.dart';

import '../../constants/data_constants/assets_manager.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({Key? key,required this.image ,this.fit}) : super(key: key);
 final String image;
 final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return image.isNotEmpty ? FadeInImage.assetNetwork(
        placeholder:ImageAssets.loadingColour,
        image: image , fit: fit,): Image.asset(ImageAssets.noImage);
  }
}
