import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/featuers/home/presentation/data/servers/api_home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiHome apiHome;

  HomeCubit(this.apiHome) : super(HomeInitial());

  Future<void> fetchProducts() async {
    try {
      emit(HomeLoading());
      final products = await apiHome.fetchProducts();
      emit(HomeSucsess(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> searchProducts(String query) async {
    emit(HomeLoading());
    try {
      final products = await apiHome.searchProducts(query);
      emit(HomeSucsess(products)); // products هنا هي List<HomeModel>
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
