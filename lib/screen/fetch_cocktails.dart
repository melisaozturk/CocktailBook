import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:flutter_projem/network/repository/coctail_repository.dart';

enum PageType { list, popular }

abstract class FetchCocktails {
  FetchCocktails() : super();
  
  factory FetchCocktails.byFormat(PageType pageType) {
    switch (pageType) {
      case PageType.list:
        return FetchList();
        case PageType.popular:
        return FetchPopularList();
      default:
        return FetchPopularList();
    }
  }
}

class FetchPopularList extends FetchCocktails {
  FetchPopularList();

 Future<void> fetchPopularCocktails(String filterParameter) async {
    try {
      final response = await CoctailRepository().getCoctailList(filterParameter);
      CocktailsDTO(drinkList: response!.drinks);
     // emit(state.copyWith(
       //   statusType: StatusType.success, drinkList: response!.drinks));
    } catch (_) {
            CocktailsDTO(drinkList: null);
    //  emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
  }
  class FetchList extends FetchCocktails {
  FetchList();

  Future<void> fetchAllCocktails(String filterParameter) async {
    try {
      final response = await CoctailRepository().getCoctailList(filterParameter);
      CocktailsDTO(drinkList: response!.drinks);
      // emit(state.copyWith(
      //   statusType: StatusType.success, drinkList: response!.drinks));
    } catch (_) {
      CocktailsDTO(drinkList: null);
      //  emit(state.copyWith(statusType: StatusType.failure, drinkList: null));
      throw Exception("Response Fail");
    }
  }
}

  class CocktailsDTO {
    CocktailsDTO({this.drinkList});

    List<Drinks>? drinkList;
  }