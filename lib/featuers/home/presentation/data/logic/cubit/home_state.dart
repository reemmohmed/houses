part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucsess extends HomeState {
  final List<dynamic> products;

  HomeSucsess(this.products);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
