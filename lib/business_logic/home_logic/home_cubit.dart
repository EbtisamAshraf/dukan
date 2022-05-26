import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dukan/data/apis/home_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/home_model.dart';
import '../../data/repositories/home_repository.dart';
part 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {

  final HomeRepository homeRepository;
  HomeCubit({required this.homeRepository}) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  late final HomeModel homeModel ;

   getHomeData(){
    emit(HomeLoadingState());
    homeRepository.getHomeData().then((value) {
        homeModel= HomeModel.fromJson(value.data);
        emit(HomeLoadedState(homeModel));
      }).catchError((error){
        emit(HomeErrorState(error.toString()));
        log( 'error'+ error.toString());
      });
  }




  final PageController bannerController = PageController();

  int currentBannerIndex =0;
  getCurrentBannerIndex(index){
    currentBannerIndex = index;
  }

  autoChangeBanner ( int length){

      Future.delayed(const Duration(seconds: 4),(){
          for(int i=currentBannerIndex ; i < length -1 ; i++){
            bannerController.nextPage(
                duration: const Duration(milliseconds: 750),
                curve: Curves.fastOutSlowIn
            );
            emit(ChangePageViewState());
          }
            } );
    }


  }

// autoChangeBanner (int length){
//
//   final count =  Stream.periodic(const Duration(seconds: 3) , (i){
//
//     bannerController.nextPage(
//         duration: const Duration(milliseconds: 750),
//         curve: Curves.fastOutSlowIn
//     );
//   });
//   final a= count.listen((_)=> _ );
//   a.onData((data) {
//   cur = 0
//     log(data.toString());
//     data < length - 1 ?  a.cancel() : log(data.toString())  ;});
//
// }


///////////////////////////
// autoChangeBanner ( int length){
//     Future.delayed(const Duration(seconds: 4),(){
//       if(currentBannerIndex == 0 ){
//       for(int i=currentBannerIndex ; i < length -1 ; i++){
//         bannerController.nextPage(
//             duration: const Duration(milliseconds: 750),
//             curve: Curves.fastOutSlowIn
//         );
//
//         emit(ChangePageViewState()); }}
//       else if(currentBannerIndex < length -1 ){
//         for(int i=currentBannerIndex ; i ==0 ; i--){
//           bannerController.previousPage(
//               duration: const Duration(milliseconds: 750),
//               curve: Curves.fastOutSlowIn
//           );
//           emit(ChangePageViewState()); }
//
//       }
//
//     });
//
//
//   }


