import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/cubit/cubit.dart';
import 'package:news_app2/cubit/cubit_state.dart';

import '../../compnents/components.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,CubitState>(
      listener:(context, state) {} ,
      builder: (context, state) {
        var list = context.read<NewsCubit>().business;
          if(state is NewsLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is NewsGetBusinessSuccessState){
            return  ListView.builder(
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(child: buildArticleWidget(list[index],context ),);
          }

        );
          }
          return Container();
      },
    );
  }
}
