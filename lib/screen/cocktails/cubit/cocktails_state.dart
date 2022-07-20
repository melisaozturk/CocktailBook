part of 'cocktails_bloc.dart';

enum StatusType {
  loading,
  success,
  failure,
}

enum ScreenMode {
  search,
  popular,
  latest,
}

abstract class CocktailsState extends Equatable {
  const CocktailsState({
    this.screenMode = ScreenMode.popular,
  });

  final ScreenMode screenMode;

  @override
  List<Object?> get props => [screenMode];
}

class CocktailsInitialize extends CocktailsState {}

