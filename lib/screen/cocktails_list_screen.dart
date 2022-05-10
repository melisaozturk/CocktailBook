import 'package:flutter/material.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';

class CocktailsListScreen extends StatefulWidget {
  final List<Drinks> drinkList;

  const CocktailsListScreen({Key? key, required this.drinkList}) : super(key: key);

  @override
  State<CocktailsListScreen> createState() => _CocktailsListScreenState();
}

class _CocktailsListScreenState extends State<CocktailsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: widget.drinkList.length,
          itemBuilder: (BuildContext context, int index) {
            return ColoredBox(
              color: Colors.green.shade100,
              child: ListTile(
                leading:
                    (widget.drinkList[index].strDrinkThumb != null && widget.drinkList[index].strDrinkThumb!.isNotEmpty)
                        ? Image.network(widget.drinkList[index].strDrinkThumb!)
                        : const Icon(Icons.no_drinks_rounded),
                trailing: const Icon(Icons.arrow_forward),
                title: Text(widget.drinkList[index].strDrink ?? ''),
              ),
            );
          },
        ),
      ),
    );
  }
}
