import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../compnents/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/cubit_state.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,CubitState>(
      listener:(context, state) {} ,
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;
        if(state is NewsLoadingState){
          return Center(child: CircularProgressIndicator());
        }
        else if(state is NewsGetSportsSuccessState){
          return  ListView.builder(
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(child: buildArticleWidget(list[index],context));
              }

          );
        }
        return Container();
      },
    );
  }
}