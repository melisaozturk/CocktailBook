import 'package:flutter/material.dart';
import 'package:flutter_projem/network/model/response-model/drinks.dart';
import 'package:go_router/go_router.dart';

class CommonListScreen extends StatelessWidget {
  const CommonListScreen({Key? key, required this.drinkList}) : super(key: key);

  final List<Drinks> drinkList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: drinkList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () => context.push(
              '/detail_screen',
              extra: drinkList[index].idDrink,
            ),
            leading: (drinkList[index].strDrinkThumb != null && drinkList[index].strDrinkThumb!.isNotEmpty)
                ? Image.network(drinkList[index].strDrinkThumb!)
                : const Icon(Icons.no_drinks_rounded),
            trailing: const Icon(Icons.arrow_forward),
            title: Text(drinkList[index].strDrink ?? ''),
          );
        },
      ),
    );
  }
}
