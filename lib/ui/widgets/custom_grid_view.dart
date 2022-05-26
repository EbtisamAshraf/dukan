

import 'package:dukan/routes.dart';
import 'package:flutter/material.dart';
import '../../constants/design_constants/colors_manager.dart';
import 'custom_image_network.dart';


Widget buildGridViewProductS(context, productList ) {
  return GridView.count(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 1 / 1.5,
      children: List.generate(
          productList.length,
              (index) => productList.isEmpty
              ? const Center(child: CircularProgressIndicator.adaptive())
              : GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.productDetailsScreenRoute , arguments: productList[index].id);
                },
                child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                                child:CustomImageNetwork(image: '${productList[index].image}',fit: BoxFit.contain),
                                width: double.infinity,
                              ),
                              if (productList[index].discount != 0)
                                PositionedDirectional(
                                  top: 12,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 3.0),
                                    color: ColorsManager.red.withOpacity(0.8),
                                    child: const Text('Discount',
                                        style: TextStyle(
                                            color: ColorsManager.white)),
                                  ),
                                ),
                              // PositionedDirectional(
                              //   end: 0,
                              //   child:CustomFavoritesIcon(id: productList[index].id, iconData: productList[index].inFavorites? Icons.favorite: Icons.favorite_border),
                              // )
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(productList[index].name.toString(),
                          maxLines: 2, overflow: TextOverflow.ellipsis ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 7.0),
                        child: Row(
                          children: [
                            Text(
                                'price: ${productList[index].price}'),
                            const Spacer(),
                            if (productList[index].discount != 0)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:10.0),
                                child: Text(
                                    '${productList[index].oldPrice}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: ColorsManager.gray,
                                        decoration:
                                        TextDecoration.lineThrough)),
                              ),


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
          ),
              )));
}