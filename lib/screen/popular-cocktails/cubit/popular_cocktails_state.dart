part of 'popular_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

class PopularCocktailsState extends Equatable {
  const PopularCocktailsState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
  });

  const PopularCocktailsState.initial() : this._();

  final StatusType statusType;
  final List<Drinks>? drinkList;

  PopularCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drinkList,
  }) {
    return PopularCocktailsState._(
      statusType: statusType,
      drinkList: drinkList,
    );
  }

  @override
  List<Object?> get props => [statusType, drinkList];
}
