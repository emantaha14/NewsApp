import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/ui/modules/business.dart';
import 'package:news_app2/ui/modules/science.dart';
import 'package:news_app2/ui/modules/sports.dart';

import '../network/remote/dio_helper.dart';
import 'cubit_state.dart';

class NewsCubit extends Cubit<CubitState> {
  NewsCubit() : super(InitialState());
  int currentIndex = 0;
  static NewsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: "Business"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "Science"
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "Sports"
    )
  ];
  List <Widget> screens = [
    Business(),
    Science(),
    Sports()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if(currentIndex ==1){
      getScience();
    }
    else if(currentIndex ==2){
      getSports();
    }
    else if(currentIndex==0){
      getBusiness();
    }
    emit(BottomNavState());
  }
  List <dynamic>business =[];

  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        queries: {
          'country': 'us',
          'category': 'business',
          'apikey': 'a7a811d3c9624dd4a0a8dfbc069f318b'
        }).then((value) {
      business = value.data['articles'];
      // print(value?.data['articles'][0]['title']);
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetErrorState(error.toString()));
      print(error.toString());
    }
    );
  }
  List <dynamic>sports =[];
  void getSports() {
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        queries: {
          'country': 'us',
          'category': 'sports',
          'apikey': 'a7a811d3c9624dd4a0a8dfbc069f318b'
        }).then((value) {
      sports = value.data['articles'];
      // print(value?.data['articles'][0]['title']);
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetErrorState(error.toString()));
      print(error.toString());
    }
    );
  }
  List <dynamic>science =[];
  void getScience() {
    emit(NewsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        queries: {
          'country': 'us',
          'category': 'science',
          'apikey': 'a7a811d3c9624dd4a0a8dfbc069f318b'
        }).then((value) {
      science = value.data['articles'];
      // print(value?.data['articles'][0]['title']);
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetErrorState(error.toString()));
      print(error.toString());
    }
    );
  }
  List <dynamic> search = [];
   void getSearch(String value){
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/everything',
        queries: {
          'q': '$value',
          'apikey': 'a7a811d3c9624dd4a0a8dfbc069f318b'
        }).then((value) {
          search = value.data['articles'];
          emit(NewsGetSearchSuccessState());
    }).catchError((error){
      emit(NewsGetErrorState(error.toString()));
    });
  }
}