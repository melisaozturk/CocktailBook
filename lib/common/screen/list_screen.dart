import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late PopularCocktailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = PopularCocktailsCubit();
    cubit.getPopularCocktails();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade100,
        ),
        child: BlocBuilder<PopularCocktailsCubit, BaseDrinksState>(
            bloc: cubit,
            builder: (BuildContext context, BaseDrinksState state) {
              return ListView.builder(
                itemCount: state.drinkList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.local_drink_sharp),
                      trailing: const Text(
                        "İçerik",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(state.drinkList![index].strDrink ?? ''));
                },
              );
            }),
      ),
    );
  }
}
