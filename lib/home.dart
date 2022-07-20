import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_bloc.dart';
import 'package:flutter_projem/screen/cocktails/cubit/cocktails_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CocktailsBloc _cocktailsBloc;

  @override
  void initState() {
    super.initState();
    _cocktailsBloc = CocktailsBloc();
  }

//todo close cubits
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // todo navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Cocktails'),
      // ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _cocktailsBloc),
        ],
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(null), label: 'Popular'),
              BottomNavigationBarItem(icon: Icon(null), label: 'Latest')
            ],
          ),
          tabBuilder: (BuildContext context, index) {
            switch (index) {
              case 0:
                return CocktailsListScreen();
              case 1:
                return CocktailsListScreen();
              default:
                return CocktailsListScreen();
            }
          },
        ),
      ),
    );
  }
}
