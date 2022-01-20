import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() =>
      _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade100,
        ),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.local_drink_sharp),
                trailing: const Text(
                  "İçerik",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("CocktailName $index"));
          },
        ),
      ),
    );
  }
}
