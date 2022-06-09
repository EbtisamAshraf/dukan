import 'package:dukan/data/model/onboarrding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class OnBoardingSlider extends StatelessWidget {
 const OnBoardingSlider(this.listOnBoardingSlider,this.index,{Key? key}) : super(key: key);

final  List<OnBoardingModel> listOnBoardingSlider;
 final int index;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height:
            MediaQuery.of(context).size.height *
                0.5,
            child: SvgPicture.asset(
              listOnBoardingSlider[index].image,
            )),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: Text(listOnBoardingSlider[index].title,style: textTheme.headlineMedium),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: Text(
            listOnBoardingSlider[index].body,
            style: textTheme.displayMedium!
                .copyWith(height: 2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}