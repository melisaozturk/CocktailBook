import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/common/widgets/sesarchbar/searchbar.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_bloc.dart';
import 'package:flutter_projem/screen/cocktails/cubit/latest_cocktails_cubit.dart';
import 'package:flutter_projem/screen/cocktails/cubit/popular_cocktails_cubit.dart';
import 'package:flutter_projem/screen/common-list-screen/cocktails_list_screen.dart';

class CocktailsListScreen extends StatefulWidget {
  const CocktailsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CocktailsListScreen> createState() => _CocktailsListScreenState();
}

class _CocktailsListScreenState extends State<CocktailsListScreen> {
  late final CocktailsBloc _cocktailsBloc;
  //late final PopularCocktailsCubit _popularCubit;
  //late final LatestCocktailsCubit _latestCubit;

  @override
  void initState() {
    super.initState();
    _cocktailsBloc = CocktailsBloc();
   //todo  _popularCubit = context.read<PopularCocktailsCubit>();
    // todo _latestCubit = context.read<LatestCocktailsCubit>();
  }

  @override
  void dispose() {
    _cocktailsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text('Cocktails'),
      ),
      body: BlocBuilder<CocktailsBloc, CocktailsState>(
        builder: (context, state) {
          switch (state.statusType) {
            case StatusType.loading:
              return const SizedBox.shrink(); //todo add loading
            case StatusType.success:
              if (state.screenMode == ScreenMode.popular) {
                if (widget.cocktailsCubit.state.popularDrinkList != null &&
                    widget.cocktailsCubit.state.popularDrinkList!.isNotEmpty) {
                  return ColoredBox(
                    color: Colors.green.shade100,
                    child: Column(
                      children: [
                        Searchbar(cubit: widget.cocktailsCubit),
                        CommonListScreen(drinkList: widget.cocktailsCubit.state.popularDrinkList!),
                      ],
                    ),
                  );
                }
              } else if (state.screenMode == ScreenMode.latest) {
                if (widget.cocktailsCubit.state.latestDrinkList != null &&
                    widget.cocktailsCubit.state.latestDrinkList!.isNotEmpty) {
                  return ColoredBox(
                    color: Colors.green.shade100,
                    child: Column(
                      children: [
                        Searchbar(cubit: widget.cocktailsCubit),
                        CommonListScreen(drinkList: widget.cocktailsCubit.state.latestDrinkList!),
                      ],
                    ),
                  );
                }
              }
              return const SizedBox.shrink();
            case StatusType.failure:
              return const SizedBox.shrink(); // todo add warn
          }
        },
      ),
    );
  }
}
