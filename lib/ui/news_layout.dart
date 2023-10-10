import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/cubit/app_cubit.dart';
import 'package:news_app2/cubit/cubit.dart';
import 'package:news_app2/cubit/cubit_state.dart';
import 'package:news_app2/ui/modules/search.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, CubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<NewsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                BlocProvider.of<AppCubit>(context).changeAppMode();
              }, icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(items: cubit.bottomItems,
          currentIndex: cubit.currentIndex,
          onTap: (int index){
            cubit.changeBottomNavBar(index);
          }
            ,),
        );
      },
    );
  }
}
