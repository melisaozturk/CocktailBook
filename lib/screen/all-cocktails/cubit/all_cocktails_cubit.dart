import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/cocktail_repository.dart';

part 'all_cocktails_state.dart';

class AllCocktailsCubit extends Cubit<AllCocktailsState> {
  AllCocktailsCubit() : super(const AllCocktailsState.initial());

  Future<void> getCocktails(filterParameter) async {
    try {
      final response = await CocktailRepository().getLatestCocktails();
      emit(state.copyWith(statusType: StatusType.success, drinkList: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
}
