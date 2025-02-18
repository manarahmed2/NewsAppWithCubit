import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cubit/Manager/cubit.dart';
import 'package:news_app_with_cubit/Manager/state.dart';
import 'package:news_app_with_cubit/models/articleModel.dart';
import 'package:news_app_with_cubit/widgets/articleWidget.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    super.key,
    required String category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      if (state is LoadedState) {
        return SliverList.builder(
            itemCount: state.x.length,
            itemBuilder: (context, index) {
              return Articlewidget(
                articles: state.x[index],
              );
            });
      } else if (state is ErrorState) {
        return SliverToBoxAdapter(child: Text("Error:${state.ErrorMessage}"));
      } else {
        return SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
