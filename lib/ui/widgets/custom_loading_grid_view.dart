

import 'package:flutter/material.dart';
import '../../constants/design_constants/colors_manager.dart';
import 'package:shimmer/shimmer.dart';


Widget buildGridViewProductS(context,  ) {
  return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 1 / 1.5,
      children: List.generate(
          10,
              (index) =>  Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child:Shimmer.fromColors(child: Container(), baseColor: ColorsManager.gray, highlightColor: ColorsManager.white)
                        ),

                    const SizedBox(
                      height: 10,
                    ),
                    Text('',
                        maxLines: 2, overflow: TextOverflow.ellipsis ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 7.0),
                      child: Row(
                        children: [
                          Text(
                              'price'),
                          const Spacer(),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1 ,
                      child: ElevatedButton.icon(

                        icon: const Icon(
                            Icons.shopping_cart_outlined),
                        label: const Text('Add to Cart'),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(7.0)

                        ),
                        onPressed: (){},
                      ),
                    )
                  ],
                ),
              ),
            ),
          )));
}