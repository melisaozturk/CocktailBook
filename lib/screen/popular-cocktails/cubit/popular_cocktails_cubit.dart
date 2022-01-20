import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/coctail_repository.dart';

part 'popular_cocktails_state.dart';

class PopularCocktailsCubit extends Cubit<BaseDrinksState> {
  PopularCocktailsCubit(
      {required BaseDrinksState initialState, required this.repository})
      : super(initialState);

  CoctailRepository repository;  

  Future<void> getPopularCocktails() async {
    try {
      final response = await CoctailRepository().getCoctailList();
      emit(state.copyWith(
          statusType: StatusType.success, drinkList: response!.drinks));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
}

// TODO: UI düzenle - istek at 