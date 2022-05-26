import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/favorites_logic/favorites_cubit.dart';
import '../widgets/custom_grid_view.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocProvider(
        create: (context) => FavoritesCubit()..getFavorites(),
        child: BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            FavoritesCubit cubit = FavoritesCubit.get(context) ;
            if (state is FavoritesLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is FavoritesErrorState) {
              return const Center(child: Text('Error'));
            } else {
            return SingleChildScrollView(
              child: Column(
                children: [buildGridViewProductS(context, cubit.getFavoritesModel.data!.data)],
              ),
            );}
          },
        ),
      ),
    );
  }
}
