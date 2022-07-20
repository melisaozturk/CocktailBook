import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/common/widgets/sesarchbar/searchbar_manager.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/cocktail_repository.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_bloc.dart';

part 'popular_cocktails_state.dart';

class PopularCocktailsCubit extends Cubit<PopularCocktailsState> with SearchBarManager {
  PopularCocktailsCubit() : super(const PopularCocktailsState.initial());

  //sil void changeScreenMode(ScreenMode screenMode) {
  //   emit(state.copyWith(screenMode: screenMode));
  // }

  Future<void> getPopularCocktails() async {
    try {
      final response = await CocktailRepository().getPopularCocktails();
      emit(state.copyWith(statusType: StatusType.success, popularDrinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, popularDrinkList: null));
      throw Exception("Response Fail");
    }
  }

  @override
  Future<void> getCocktailsbyIngredient() async {
    try {
      final response = await CocktailRepository().getCocktailsbyIngredient(state.searchText);
      emit(state.copyWith(statusType: StatusType.success, popularDrinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, popularDrinkList: null));
      throw Exception("Response Fail");
    }
  }

  @override
  void resetSearch() async {
    emit(state.copyWith(popularDrinkList: [], searchText: '', statusType: StatusType.loading));
    await getPopularCocktails();
  }

  @override
  void updateSearchText(String searchText) async {
    if (searchText != state.searchText) {
      emit(state.copyWith(searchText: searchText, statusType: StatusType.loading));
      await getCocktailsbyIngredient();
    }
  }
}
