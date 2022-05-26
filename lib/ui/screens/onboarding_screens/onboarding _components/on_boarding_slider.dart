import 'package:dukan/data/model/onboarrding_model.dart';
import 'package:flutter/material.dart';



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
                0.4,
            child: Image.asset(
              listOnBoardingSlider[index].image,
            )),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: listOnBoardingSlider[index].title,
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: Text(
            listOnBoardingSlider[index].body,
            style: textTheme.bodyText2!
                .copyWith(height: 2),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}