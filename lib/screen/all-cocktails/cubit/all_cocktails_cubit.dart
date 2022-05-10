import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/coctail_repository.dart';

part '../../../screen/all-cocktails/cubit/all_cocktails_state.dart';

class AllCocktailsCubit extends Cubit<AllCocktailsState> {
  AllCocktailsCubit() : super(AllCocktailsState.initial());
  //  {
  //   fetchCocktails = FetchCocktails.byFormat(pageType);
  // }

//late FetchCocktails fetchCocktails;
//PageType get pageType => state.pageType == PageType.list ? PageType.list : PageType.popular;

  Future<void> getCocktails(filterParameter) async {
    try {
      final response = await CoctailRepository().getCoctailList(filterParameter);
      emit(state.copyWith(statusType: StatusType.success, drinkList: response!.drinks));
    } catch (_) {
      emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
}
