import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/category_details_logic/category_details_cubit.dart';
import '../widgets/custom_grid_view.dart';
import '../widgets/custom_offline.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen(
      {Key? key, required this.id, required this.categoryName})
      : super(key: key);

  final int? id;
  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return CustomOffline(
      onLineChild: BlocProvider(
        create: (context) => CategoryDetailsCubit()..getCategoryDetails(id!),
        child: BlocBuilder<CategoryDetailsCubit, CategoryDetailsState>(
          builder: (context, state) {
            CategoryDetailsCubit cubit = CategoryDetailsCubit.get(context);

            if (state is CategoryDetailsLoadingState) {
              return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
            } else if (state is CategoryDetailsErrorState) {
              return const Scaffold(body: Center(child: Text('Error')));
            } else {
              return Scaffold(
                appBar: AppBar(title: Text(categoryName!)),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildGridViewProductS(
                          context, cubit.categoryDetailsModel.data!.data),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
