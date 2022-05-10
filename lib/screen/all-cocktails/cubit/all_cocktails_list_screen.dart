import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/all-cocktails/cubit/all_cocktails_cubit.dart';
import 'package:flutter_projem/screen/cocktails_list_screen.dart';

class AllCocktailsListScreen extends StatefulWidget {
  const AllCocktailsListScreen({
    Key? key,
    required this.allCocktailsCubit,
  }) : super(key: key);

  final AllCocktailsCubit allCocktailsCubit;

  @override
  State<AllCocktailsListScreen> createState() => _AllCocktailsListScreenState();
}

class _AllCocktailsListScreenState extends State<AllCocktailsListScreen> { 

  @override
  void dispose() {
    widget.allCocktailsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCocktailsCubit, AllCocktailsState>(
      builder: (context, state) {
        if (state.drinkList != null && state.drinkList!.isNotEmpty) {
          return CocktailsListScreen(drinkList: state.drinkList!);
        }
        return const SizedBox();
      },
    );
  }
}
