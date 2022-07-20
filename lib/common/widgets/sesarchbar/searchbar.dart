import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_bloc.dart';

enum SearchStatusType { loading, success, failure }

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key, required this.cubit}) : super(key: key);

  final CocktailsCubit cubit;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CocktailsCubit, CocktailsState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _editingController,
              decoration: const InputDecoration(
                labelText: 'Search Ingredient',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onSubmitted: (text) {
                // todo popular cubit için de ekran modu ekleyerek aynı işlemleri yap.
                if (text.isEmpty) {
                  widget.cubit.resetSearch();
                } else {
                  widget.cubit.updateSearchText(text);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
