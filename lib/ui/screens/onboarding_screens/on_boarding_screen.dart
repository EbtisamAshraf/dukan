import 'package:dukan/constants/data_constants/collections_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/onboarding_logic/onboarding_cubit.dart';
import '../main_screen.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          OnBoardingCubit.get(context).changeIsSkip();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (C) => const MainScreen()));
                        },
                        child:  Text(
                          'SKIP',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CustomIndicator(
                        list: CollectionsManager.onBoardingList,
                        index: OnBoardingCubit.get(context)
                            .indexOfOnBoardingPageView,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (OnBoardingCubit.get(context).isLastIndex) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (C) => const MainScreen()));
                          } else {
                            boardController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInBack);
                          }
                        },
                        child: const Icon(Icons.arrow_forward_ios, size: 15),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(const CircleBorder()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
