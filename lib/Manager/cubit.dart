import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_cubit/Manager/state.dart';
import 'package:news_app_with_cubit/models/articleModel.dart';
import 'package:news_app_with_cubit/network/apiServices.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  Apiservices apiservices = Apiservices();

  getNews({String? category}) async {
    emit(IsLoadingState());
    try {
      var json = await apiservices.get(
          endPoint:
              "v2/top-headlines?country=us&apiKey=8840025c16be45269b99b02fe8e22baa&category=$category");
      List<Articlemodel> articles = [];
      for (var i in json["articles"]) {
        articles.add(Articlemodel(
          url: i["url"],
          title: i["title"],
          description: i["description"],
          urlToImage: i["urlToImage"],
        ));
      }
      emit(LoadedState(x: articles));
    } on Exception catch (e) {
      emit(ErrorState(ErrorMessage: e.toString()));
    }
  }
}
