import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/product_details_logic/product_details_cubit.dart';
import '../../data/model/product_details_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_offline.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.id}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    return CustomOffline(
      onLineChild: BlocProvider(
        create: (context) => ProductDetailsCubit()..getProductDetails(id!),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {

            ProductDetailsCubit cubit = ProductDetailsCubit.get(context);

            if (state is ProductDetailsLoadingState) {
              return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
            } else if (state is ProductDetailsErrorState) {
              return const Scaffold(body: Center(child: Text('Error')));
            } else {
              return Scaffold(
                appBar: AppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildProductImage(context, cubit.productDetailsModel.data!.image),
                      const SizedBox(
                        height: 20,
                      ),
                      buildProductDetails(context,cubit.productDetailsModel),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
                bottomSheet: buildBottomSheet(context,cubit.productDetailsModel),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildProductImage(context,String? image) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image!), fit: BoxFit.contain)),
    );
  }

  Widget buildProductDetails(context ,ProductDetailsModel  productDetails) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${productDetails.data!.name}',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(
            height: 30,
          ),
          Text('Details', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: 20,
          ),
          Text('${productDetails.data!.description}',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(height: 1.7))
        ],
      ),
    );
  }

  Widget buildBottomSheet(context, ProductDetailsModel  productDetails) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('PRICE', style: Theme.of(context).textTheme.displaySmall),
            Text('\$${productDetails.data!.price}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        customElevatedButton(
            context: context, text: 'ADD', width: 0.3, onPressed: () {}),
      ]),
    );
  }
}
