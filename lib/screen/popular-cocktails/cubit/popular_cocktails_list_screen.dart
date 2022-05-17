import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/cocktails_list_screen.dart';
import 'package:flutter_projem/screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';

class PopularCocktailsListScreen extends StatefulWidget {
  const PopularCocktailsListScreen({Key? key, required this.popularCocktailsCubit}) : super(key: key);

  final PopularCocktailsCubit popularCocktailsCubit;

  @override
  _PopularCocktailsListScreenState createState() => _PopularCocktailsListScreenState();
}

class _PopularCocktailsListScreenState extends State<PopularCocktailsListScreen> {
  @override
  void dispose() {
    widget.popularCocktailsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCocktailsCubit, PopularCocktailsState>(
      builder: (context, state) {
        if (state.drinkList != null && state.drinkList!.isNotEmpty) {
          return CocktailsListScreen(drinkList: state.drinkList!);
        }
        return const SizedBox();
      },
    );
  }
}
