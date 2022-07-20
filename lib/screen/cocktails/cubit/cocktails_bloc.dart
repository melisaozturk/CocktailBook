import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_projem/screen/cocktails/cubit/latest_cocktails_cubit.dart';
import 'package:flutter_projem/screen/cocktails/cubit/popular_cocktails_cubit.dart';

part 'cocktails_state.dart';
part 'cocktails_event.dart';

class CocktailsBloc extends Bloc<CocktailsEvent, CocktailsState> {
  CocktailsBloc() : super(CocktailsInitialize()) {
    if (state.screenMode == ScreenMode.popular) {
      add(PopularCocktailsEvent());
    } else {
      add(LatestCocktailsEvent());
    }
    on<PopularCocktailsEvent>(_onPopularCocktails);
    on<LatestCocktailsEvent>(_onLatestCocktails);
  }

  void changeScreenMode(ScreenMode screenMode) {
    if (state.screenMode != screenMode) {
      if (screenMode == ScreenMode.popular) {
        add(PopularCocktailsEvent());
      } else {
        add(LatestCocktailsEvent());
      }
    }
  }

  Future<void> _onPopularCocktails(
    PopularCocktailsEvent event,
    Emitter<CocktailsState> emit,
  ) async {
    final cubit = PopularCocktailsCubit();
    await cubit.getPopularCocktails();
  }

  Future<void> _onLatestCocktails(
    LatestCocktailsEvent event,
    Emitter<CocktailsState> emit,
  ) async {
    final cubit = LatestCocktailsCubit();
    await cubit.getCocktails();
  }
}
