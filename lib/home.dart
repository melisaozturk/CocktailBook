import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/all-cocktails/cubit/all_cocktails_cubit.dart';
import 'package:flutter_projem/screen/all-cocktails/cubit/all_cocktails_list_screen.dart';
import 'package:flutter_projem/screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';
import 'package:flutter_projem/screen/popular-cocktails/cubit/popular_cocktails_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PopularCocktailsCubit _popularCocktailsCubit;
  late final AllCocktailsCubit _allCocktailsCubit;

  @override
  void initState() {
    super.initState();
    _allCocktailsCubit = AllCocktailsCubit();
    _allCocktailsCubit.getCocktails('');
    
    _popularCocktailsCubit = PopularCocktailsCubit();
    _popularCocktailsCubit.getPopularCocktails('');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cocktails'),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _allCocktailsCubit),
            BlocProvider.value(value: _popularCocktailsCubit),
          ],
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: const [
                BottomNavigationBarItem(icon: Icon(null), label: 'Cocktails'),
                BottomNavigationBarItem(icon: Icon(null), label: 'Popular Cocktails')
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              switch (index) {
                case 0:
                  return PopularCocktailsListScreen(popularCocktailsCubit: _popularCocktailsCubit);
                case 1:
                  return AllCocktailsListScreen(allCocktailsCubit: _allCocktailsCubit);
                default:
                  return PopularCocktailsListScreen(popularCocktailsCubit: _popularCocktailsCubit);
              }
            },
          ),
        ));
  }
}
