import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/onboarrding_model.dart';
import 'assets_manager.dart';

class CollectionsManager {
  static const List list = [];
  static const Set set = {};
  static const Map map = {};

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        image: ImageAssets.onBoardingImage2,
        title: const Text('welcome \n to'),
        body: 'It\'d be great'),
    OnBoardingModel(
        image: ImageAssets.onBoardingImage1,
        title: const Text('welcome \n to'),
        body: 'It\'d be great'),
  ];
}
