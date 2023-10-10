import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../network/local/cashe_helper.dart';
import 'app_cubit_state.dart';


class AppCubit extends Cubit<AppcubitState> {
  AppCubit() : super(AppcubitInitial());

  bool isDark = false;
  void changeAppMode({bool ?fromShared}) {
    if(fromShared!=null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }
    else{
      isDark = !isDark;
      CachedHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });

    }


  }
}