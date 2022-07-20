part of 'latest_cocktails_cubit.dart';


class LatestCocktailsState extends Equatable {
  const LatestCocktailsState._({
    this.statusType = StatusType.loading,
    this.latestDrinkList = const [],
    this.searchText = '',
    this.screenMode = ScreenMode.popular,
  });

  const LatestCocktailsState.initial() : this._();

  final StatusType statusType;
  final List<Drinks>? latestDrinkList;
  final String searchText;
  final ScreenMode screenMode;

  LatestCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? latestDrinkList,
    String searchText = '',
    ScreenMode screenMode = ScreenMode.popular,
  }) {
    return LatestCocktailsState._(
      statusType: statusType,
      latestDrinkList: latestDrinkList ?? latestDrinkList,
      searchText: searchText,
      screenMode: screenMode,
    );
  }

  @override
  List<Object?> get props => [statusType, latestDrinkList, searchText, screenMode];
}
