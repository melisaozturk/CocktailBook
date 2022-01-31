part of '../../../screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

class BaseDrinksState extends Equatable {
  BaseDrinksState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
  //  this.pageType = PageType.list,    
  });

  BaseDrinksState.initial() : this._();

  late StatusType statusType;
  late List<Drinks>? drinkList;  
 // late PageType pageType;

  BaseDrinksState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drinkList,
   // PageType pageType = PageType.list,
  }) {
    return BaseDrinksState._(
      statusType: statusType,
      drinkList: drinkList,
   //   pageType: pageType,
    );
  }

  @override
  List<Object> get props => [statusType, drinkList!];
}
