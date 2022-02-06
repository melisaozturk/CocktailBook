import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/popular-cocktails/cubit/popular_cocktails_cubit.dart';
import 'package:http/http.dart' as http;

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
          color: Colors.green.shade100,
        ),
        child: BlocBuilder<PopularCocktailsCubit, BaseDrinksState>(
            bloc: cubit,
            builder: (BuildContext context, BaseDrinksState state) {
              return ListView.builder(
                itemCount: state.drinkList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: Image.network(state.drinkList![index].strDrinkThumb ?? ''),  //downloadImage(state.drinkList![index].strDrinkThumb ?? ''),
                      trailing: const Icon(Icons.arrow_forward),
                      title: Text(state.drinkList![index].strDrink ?? ''));
                },
              );
            }),
      ),
    );
  }

// Widget projectWidget() {
//   return FutureBuilder(
//     builder: (context, projectSnap) {
//       if (projectSnap.connectionState == ConnectionState.none &&
//           projectSnap.hasData == null) {
//         //print('project snapshot data is: ${projectSnap.data}');
//         return Container();
//       }
//       return ListView.builder(
//         itemCount: projectSnap.data.length,
//         itemBuilder: (context, index) {
//           ProjectModel project = projectSnap.data[index];
//           return Column(
//             children: <Widget>[
//               // Widget to display the list of project
//             ],
//           );
//         },
//       );
//     },
//     future: setImage(state.drinkList![index].strDrinkThumb ?? ''),
//   );
// }

  // Future<Widget> setImage(String url) async {
  //   String imageUrl = url;
  //   Uint8List response =
  //       await http.get(Uri.parse(imageUrl)).then((value) => value.bodyBytes);
  //   return Image.memory(
  //       response); //(downloadImage(state.drinkList![index].strDrinkThumb ?? ''));
  // }

  Widget downloadImage(String url) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
         if (snapshot.connectionState == ConnectionState.none &&
          snapshot.hasData == null) {
        print('project snapshot data is: ${snapshot.data}');
        return Container();
      } 
      print('project snapshot data is: ${snapshot.data}');
        return Image.memory(snapshot.data);
        
      },
      future: http.get(Uri.parse(url)).then((value) => value.bodyBytes),
    );

    //     String imageUrl = url;
    // Uint8List response = await http.get(Uri.parse(imageUrl)).then(
    // (value) => value.bodyBytes);
    // return Image.memory(response);//(downloadImage(state.drinkList![index].strDrinkThumb ?? ''));
  }
}
