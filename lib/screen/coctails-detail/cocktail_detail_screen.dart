import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/coctails-detail/cubit/cocktail_detail_cubit.dart';
import 'package:go_router/go_router.dart';

class CocktailDetailScreen extends StatefulWidget {
  const CocktailDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<CocktailDetailScreen> createState() => _CocktailDetailScreenState();
}

class _CocktailDetailScreenState extends State<CocktailDetailScreen> {
  late final CocktailDetailCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = CocktailDetailCubit();
    _cubit.getCocktaildetail(widget.id);
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
        leading: IconButton(
          onPressed: () => router.pop(), 
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder(
        bloc: _cubit,
        builder: (BuildContext context, CocktailDetailState state) {
          if (state.drink != null && state.drink!.isNotEmpty) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network(state.drink![0].strDrinkThumb ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Name: ${state.drink![0].strDrink}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Glass Type: ${state.drink![0].strGlass}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Instructions: \n${state.drink![0].strInstructions}'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text('Ingredients:'),
                  ),
                  if (state.drink![0].strIngredient1 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient1} ${state.drink![0].strMeasure1} == nil ? '' : ( ${state.drink![0].strMeasure1} )'),
                    ),
                  if (state.drink![0].strIngredient2 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient2} ${state.drink![0].strMeasure2} == nil ? '' : ( ${state.drink![0].strMeasure2} )'),
                    ),
                  if (state.drink![0].strIngredient3 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient3} ${state.drink![0].strMeasure3} == nil ? '' : ( ${state.drink![0].strMeasure3} )'),
                    ),
                  if (state.drink![0].strIngredient4 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient4} ${state.drink![0].strMeasure4} == nil ? '' : ( ${state.drink![0].strMeasure4} )'),
                    ),
                  if (state.drink![0].strIngredient5 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient5} ${state.drink![0].strMeasure5} == nil ? '' : ( ${state.drink![0].strMeasure5} )'),
                    ),
                  if (state.drink![0].strIngredient6 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient6} ${state.drink![0].strMeasure6} == nil ? '' : ( ${state.drink![0].strMeasure6} )'),
                    ),
                  if (state.drink![0].strIngredient7 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient7} ${state.drink![0].strMeasure7} == nil ? '' :( ${state.drink![0].strMeasure7} )'),
                    ),
                  if (state.drink![0].strIngredient8 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient8} ${state.drink![0].strMeasure8} == nil ? '' : ( ${state.drink![0].strMeasure8} )'),
                    ),
                  if (state.drink![0].strIngredient9 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient9} ${state.drink![0].strMeasure9} == nil ? '' : ( ${state.drink![0].strMeasure9} )'),
                    ),
                  if (state.drink![0].strIngredient10 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient10} ${state.drink![0].strMeasure10} == nil ? '' : ( ${state.drink![0].strMeasure10} )'),
                    ),
                  if (state.drink![0].strIngredient11 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient11} ${state.drink![0].strMeasure11} == nil ? '' : ( ${state.drink![0].strMeasure11} )'),
                    ),
                  if (state.drink![0].strIngredient12 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient12} ${state.drink![0].strMeasure12} == nil '' : ( ${state.drink![0].strMeasure12} )'),
                    ),
                  if (state.drink![0].strIngredient13 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient13} ${state.drink![0].strMeasure13} == nil '' : ? ( ${state.drink![0].strMeasure13} )'),
                    ),
                  if (state.drink![0].strIngredient14 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient14} ${state.drink![0].strMeasure14} == nil ? '' : ( ${state.drink![0].strMeasure14} )'),
                    ),
                  if (state.drink![0].strIngredient15 != null)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('- ${state.drink![0].strIngredient15} ${state.drink![0].strMeasure15} == nil ? '' : ( ${state.drink![0].strMeasure15} )'),
                    ),                    
                ],
              ),
            );
          } else {
            return const SizedBox(); // TOD show error message
          }
        },
      ),
    );
  }
}
