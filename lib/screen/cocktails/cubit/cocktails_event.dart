part of 'cocktails_bloc.dart';

abstract class CocktailsEvent extends Equatable {
  const CocktailsEvent();

  @override
  List<Object> get props => [];
}

class PopularCocktailsEvent extends CocktailsEvent {}

class LatestCocktailsEvent extends CocktailsEvent {}
 