part of '../../../screen/all-cocktails/cubit/all_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

class AllCocktailsState extends Equatable {
  AllCocktailsState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
    //  this.pageType = PageType.list,
  });

  AllCocktailsState.initial() : this._();

  late StatusType statusType;
  late List<Drinks>? drinkList;
  // late PageType pageType;

  AllCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drinkList,
    // PageType pageType = PageType.list,
  }) {
    return AllCocktailsState._(
      statusType: statusType,
      drinkList: drinkList,
      //   pageType: pageType,
    );
  }

  @override
  List<Object> get props => [statusType, drinkList!];
}
