import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/compnents/components.dart';
import 'package:news_app2/cubit/cubit.dart';
import 'package:news_app2/cubit/cubit_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, CubitState>(
      listener: (context, state) {
        // You can handle state changes here if needed
      },
      builder: (context, state) {
        var list = BlocProvider.of<NewsCubit>(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: searchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    // You should dispatch an event or call a method to perform the search
                    BlocProvider.of<NewsCubit>(context).getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    // Assuming buildArticleWidget is a custom function to build article widgets
                    return Card(child: buildArticleWidget(list[index], context));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
