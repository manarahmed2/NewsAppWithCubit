import 'package:news_app_with_cubit/models/articleModel.dart';

class AppState {}

class InitialState extends AppState {}

class LoadedState extends AppState {
  final List<Articlemodel> x;
  LoadedState({required this.x});
}

class ErrorState extends AppState {
  final String ErrorMessage;

  ErrorState({required this.ErrorMessage});
}

class IsLoadingState extends AppState {}
