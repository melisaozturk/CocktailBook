part of '../../../screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

class PopularCocktailsState extends Equatable {
  PopularCocktailsState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
    //  this.pageType = PageType.list,
  });

  PopularCocktailsState.initial() : this._();

  late StatusType statusType;
  late List<Drinks>? drinkList;
  // late PageType pageType;

  PopularCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drinkList,
    // PageType pageType = PageType.list,
  }) {
    return PopularCocktailsState._(
      statusType: statusType,
      drinkList: drinkList,
      //   pageType: pageType,
    );
  }

  @override
  List<Object> get props => [statusType, drinkList!];
}
