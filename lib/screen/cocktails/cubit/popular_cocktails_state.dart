part of 'popular_cocktails_cubit.dart';

class PopularCocktailsState extends Equatable {
  const PopularCocktailsState._({
    this.statusType = StatusType.loading,
    this.popularDrinkList = const [],
    this.latestDrinkList = const [],
    this.searchText = '',
    this.screenMode = ScreenMode.popular,
  });

  const PopularCocktailsState.initial() : this._();

  //todo factory CocktailsState.initialWithScreenMode(ScreenMode screenMode) => CocktailsState._(
  //       screenMode: screenMode,
  //     );

  final StatusType statusType;
  final List<Drinks>? popularDrinkList;
  final List<Drinks>? latestDrinkList;
  final String searchText;
  final ScreenMode screenMode;

  PopularCocktailsState copyWith({
    StatusType statusType = StatusType.loading,
    List<Drinks>? popularDrinkList,
    List<Drinks>? latestDrinkList,
    String searchText = '',
    ScreenMode screenMode = ScreenMode.popular,
  }) {
    return PopularCocktailsState._(
      statusType: statusType,
      popularDrinkList: popularDrinkList ?? popularDrinkList,
      latestDrinkList: latestDrinkList ?? latestDrinkList,
      searchText: searchText,
      screenMode: screenMode,
    );
  }

  @override
  List<Object?> get props => [statusType, popularDrinkList, latestDrinkList, searchText, screenMode];
}
