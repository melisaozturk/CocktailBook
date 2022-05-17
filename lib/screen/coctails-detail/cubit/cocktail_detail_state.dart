part of 'cocktail_detail_cubit.dart';

enum StatusType { loading, success, failure }

class CocktailDetailState extends Equatable {
  const CocktailDetailState._({
    this.statusType = StatusType.loading,
    this.drink,
  });

  const CocktailDetailState.initial() : this._();

  final StatusType statusType;
  final List<Drinks>? drink;

  CocktailDetailState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? drink,
  }) {
    return CocktailDetailState._(
      statusType: statusType,
      drink: drink,
    );
  }

  @override
  List<Object?> get props => [statusType, drink];
}
