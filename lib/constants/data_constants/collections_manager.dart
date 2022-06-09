
import '../../data/model/onboarrding_model.dart';
import 'assets_manager.dart';

class CollectionsManager {
  static const List list = [];
  static const Set set = {};
  static const Map map = {};

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        image: ImageAssets.onBoardingImage1,
        title: 'Discover the best products',
        body: 'Browse products now on the application\n and get your favorite product'),
    OnBoardingModel(
        image: ImageAssets.onBoardingImage2,
        title: 'Choose your favorite product',
        body: 'Choose the product you want to buy and\n start the buying process with ease'),
    OnBoardingModel(
        image: ImageAssets.onBoardingImage3,
        title: 'Confirm your purchase',
        body: 'Confirm the purchase of your product\n and choose the best delivery ways'),
  ];
}
