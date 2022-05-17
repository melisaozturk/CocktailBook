import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/cocktail_repository.dart';

part 'popular_cocktails_state.dart';

class PopularCocktailsCubit extends Cubit<PopularCocktailsState> {
  PopularCocktailsCubit() : super(const PopularCocktailsState.initial());

  Future<void> getPopularCocktails(String filterParameter) async {
    try {
      final response = await CocktailRepository().getPopularCocktails(filterParameter);
      emit(state.copyWith(statusType: StatusType.success, drinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
}
