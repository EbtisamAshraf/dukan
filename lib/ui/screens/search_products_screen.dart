import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/search_products_logic/search_products_cubit.dart';
import '../../constants/design_constants/colors_manager.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_offline.dart';

class SearchProductsScreen extends StatelessWidget {
  const SearchProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOffline(
      onLineChild: BlocProvider(
        create: (context) =>
        SearchProductsCubit()
          ..searchProducts(''),
        child: BlocBuilder<SearchProductsCubit, SearchProductsState>(
          builder: (context, state) {
            SearchProductsCubit cubit = SearchProductsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: buildSearchBar(onSubmitted: (val) {
                  cubit.searchProducts(val);
                }),
              ),
              body: state is SearchProductsLoadedState ?
              SingleChildScrollView(
                      child: Column(
                        children: [
                          buildGridViewProductS(
                              context, cubit.searchProductsModel.data!.data
                          ),
                        ],
                      ),
                    ):
              const Center(child: CircularProgressIndicator.adaptive())

            ); }
        ),
      ),
    );
  }

  Widget buildSearchBar({ValueChanged<String>? onSubmitted}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onSubmitted: onSubmitted,
        cursorColor: ColorsManager.primaryColor,
        decoration: InputDecoration(
            fillColor: ColorsManager.gray.withOpacity(0.2),
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            hintText: "Search"),
      ),
    );
  }
}
