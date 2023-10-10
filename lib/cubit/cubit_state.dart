abstract class CubitState {}
class InitialState extends CubitState {}
class BottomNavState extends CubitState {}
class NewsLoadingState extends CubitState{}
class NewsGetBusinessSuccessState extends CubitState{}
class NewsGetSportsSuccessState extends CubitState{}
class NewsGetScienceSuccessState extends CubitState{}
class NewsGetSearchSuccessState extends CubitState{}
class NewsGetErrorState extends CubitState{
  final String error;
  NewsGetErrorState(this.error);
}