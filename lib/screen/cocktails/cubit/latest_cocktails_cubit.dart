import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/common/widgets/sesarchbar/searchbar_manager.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/cocktail_repository.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_bloc.dart';

part 'latest_cocktails_state.dart';

class LatestCocktailsCubit extends Cubit<LatestCocktailsState> with SearchBarManager {
  LatestCocktailsCubit() : super(const LatestCocktailsState.initial());

  Future<void> getCocktails() async {
    try {
      final response = await CocktailRepository().getLatestCocktails();
      emit(state.copyWith(statusType: StatusType.success, latestDrinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, latestDrinkList: null));
      throw Exception("Response Fail");
    }
  }

  @override
  Future<void> getCocktailsbyIngredient() async {
    try {
      final response = await CocktailRepository().getCocktailsbyIngredient(state.searchText);
      emit(state.copyWith(statusType: StatusType.success, latestDrinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, latestDrinkList: null));
      throw Exception("Response Fail");
    }
  }

  @override
  void resetSearch() async {
    emit(state.copyWith(latestDrinkList: [], searchText: '', statusType: StatusType.loading));
    await getCocktails();
  }

  @override
  void updateSearchText(String searchText) async {
    if (searchText != state.searchText) {
      emit(state.copyWith(searchText: searchText, statusType: StatusType.loading));
      await getCocktailsbyIngredient();
    }
  }
}
