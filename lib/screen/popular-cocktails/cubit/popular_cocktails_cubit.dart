import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/coctail_repository.dart';

part '../../../common/screen/state/base_drinks_state.dart';

class PopularCocktailsCubit extends Cubit<BaseDrinksState> {
  PopularCocktailsCubit()
      : super(BaseDrinksState.initial());
      //  {
      //   fetchCocktails = FetchCocktails.byFormat(pageType);
      // }

//late FetchCocktails fetchCocktails;
//PageType get pageType => state.pageType == PageType.list ? PageType.list : PageType.popular; 

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
