import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/cocktail_repository.dart';

part 'cocktail_detail_state.dart';

class CocktailDetailCubit extends Cubit<CocktailDetailState> {
  CocktailDetailCubit() : super(const CocktailDetailState.initial());

  Future<void> getCocktaildetail(String id) async {
    try {
      final response = await CocktailRepository().getCocktailIngredient(id);
      emit(state.copyWith(statusType: StatusType.success, drink: response!.drinks ?? []));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, drink: null));
      throw Exception("Response Fail");
    }
  }
}
