import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app2/cubit/app_cubit_state.dart';
import 'package:news_app2/network/remote/dio_helper.dart';
import 'package:news_app2/ui/news_layout.dart';

import 'cubit/app_cubit.dart';
import 'cubit/cubit.dart';
import 'network/local/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachedHelper.init();
  bool? isDark = CachedHelper.getData(key: 'isDark');
  runApp( MyApp(isDark: isDark,));

}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp({super.key, this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(create:
        (BuildContext context) => NewsCubit()..getBusiness(),),
    BlocProvider(
    create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
    )],
    child:BlocConsumer<AppCubit, AppcubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
                cardColor: HexColor('333739'),
                scaffoldBackgroundColor: HexColor('333739'),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(backgroundColor: HexColor('333739'),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light
                    ),
                    titleTextStyle: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                    actionsIconTheme: IconThemeData(
                        color: Colors.white,
                        size: 30
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: HexColor('333739'),
                    unselectedItemColor: Colors.grey
                ),
                textTheme: TextTheme(
                    headlineLarge: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    )
                )
            ),
            themeMode: BlocProvider.of<AppCubit>(context).isDark? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                textTheme: TextTheme(
                    headlineLarge: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black
                    )
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.black

                    ),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark
                    ),
                    titleTextStyle: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
                    actionsIconTheme: IconThemeData(
                        color: Colors.black,
                        size: 30
                    )
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange
                )
            ),
            home: NewsLayout(),
          );
        },

      ),
    );
  }
}