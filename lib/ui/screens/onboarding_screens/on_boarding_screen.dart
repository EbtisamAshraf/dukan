import 'package:dukan/constants/data_constants/collections_manager.dart';
import 'package:dukan/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/onboarding_logic/onboarding_cubit.dart';
import '../../widgets/custom_indicator.dart';
import 'onboarding _components/on_boarding_slider.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: PageView.builder(
                        controller: boardController,
                        onPageChanged: (index) {
                          OnBoardingCubit.get(context)
                              .changeIndexOfOnBoardingPageView(
                                  index, CollectionsManager.onBoardingList);
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: CollectionsManager.onBoardingList.length,
                        itemBuilder: (c, i) => OnBoardingSlider(
                            CollectionsManager.onBoardingList, i)),
                  ),
                  const Spacer(),
                  CustomIndicator(
                    list: CollectionsManager.onBoardingList,
                    index:
                        OnBoardingCubit.get(context).indexOfOnBoardingPageView,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        OnBoardingCubit.get(context).changeIsSkip();
                        Navigator.pushReplacementNamed(context, Routes.mainScreenRoute);
                      },
                      child: const Text('Start shopping now'),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18,)
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
