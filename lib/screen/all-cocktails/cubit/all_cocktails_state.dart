part of 'all_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

class AllCocktailsState extends Equatable {
  const AllCocktailsState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
  });

  const AllCocktailsState.initial() : this._();

  final StatusType statusType;
  final List<Drinks>? drinkList;

  AllCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drinkList,
  }) {
    return AllCocktailsState._(
      statusType: statusType,
      drinkList: drinkList,
    );
  }

  @override
  List<Object?> get props => [statusType, drinkList];
}
