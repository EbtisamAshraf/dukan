import 'package:dukan/business_logic/home_logic/home_cubit.dart';
import 'package:dukan/data/apis/home_api.dart';
import 'package:dukan/data/model/categories_model.dart';
import 'package:dukan/data/model/home_model.dart';
import 'package:dukan/routes.dart';
import 'package:dukan/ui/widgets/custom_badges.dart';
import 'package:dukan/ui/widgets/custom_offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/categories_logic/categories_cubit.dart';
import '../../data/model/arguments_model/category_details_arguments_model.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_image_network.dart';
import '../widgets/custom_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOffline(
      onLineChild: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HomeCubit(homeRepository: HomeApi())..getHomeData(),
          ),
          BlocProvider(
            create: (context) =>
                CategoriesCubit(homeRepository: HomeApi())..getCategories(),
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit homeCubit = HomeCubit.get(context);

            if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is HomeErrorState) {
              return const Center(child: Text('Error'));
            } else {
              return SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                      actions: [
                        CustomBadges(
                          badgeContent: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 30,
                                )),
                          ),
                        ),
                      ],
                      title: Text(
                        'Dukan',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          buildTitle('Categories'),
                          const SizedBox(
                            height: 16,
                          ),
                          BlocBuilder<CategoriesCubit, CategoriesState>(
                            builder: (context, state) {
                              if (state is CategoriesLoadingState) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
                              } else if (state is CategoriesErrorState) {
                                return const Center(
                                    child:
                                        CircularProgressIndicator.adaptive());
                              } else {
                                return buildCategories(
                                    context,
                                    CategoriesCubit.get(context)
                                        .categoriesModel
                                        .data
                                        ?.data);
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          buildBanners(
                              context: context,
                              listOfBanners: homeCubit.homeModel.data!.banners),
                          const SizedBox(
                            height: 30,
                          ),
                          buildTitle('Products'),
                          const SizedBox(
                            height: 20,
                          ),
                          buildGridViewProductS(
                              context, homeCubit.homeModel.data!.products!),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildCategories(context, List<DataModel>? categoriesModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categoriesModel?.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, Routes.categoryDetailsScreenRoute,
                      arguments: CategoryDetailsArgumentsModel(
                        id: categoriesModel![index].id,
                        categoryName: categoriesModel[index].name,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 100,
                          child: CustomImageNetwork(
                              image: '${categoriesModel![index].image}',
                              fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('${categoriesModel[index].name}')
                    ],
                  ),
                ),
              )),
    );
  }

  Widget buildBanners({context, required List<Banners>? listOfBanners}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
          controller: HomeCubit.get(context).bannerController,
          onPageChanged:
              HomeCubit.get(context).autoChangeBanner(listOfBanners!.length),
          itemCount: listOfBanners.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            HomeCubit.get(context).getCurrentBannerIndex(index);
            return listOfBanners.isEmpty
                ? const Center(child: CircularProgressIndicator.adaptive())
                : Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${listOfBanners[index].image}'),
                                fit: BoxFit.cover)),
                      ),
                      PositionedDirectional(
                          end: 0,
                          start: 0,
                          bottom: 10,
                          child: CustomIndicator(
                            index: index,
                            list: listOfBanners,
                          )),
                    ],
                  );
          }),
    );
  }

  Widget buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
