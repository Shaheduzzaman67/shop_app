
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopapp/model/DrinkListModel.dart';
import 'package:shopapp/model/DrinkType.dart';
import 'package:shopapp/widget/DrinkList.dart';
import 'package:shopapp/widget/DrinksCarousel.dart';

class StoreHomePage extends StatelessWidget {
  final String title;

  const StoreHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DrinkListModel>(
      model: DrinkListModel(),
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            DrinksCarousel(),
            DrinkList(),
          ],
        ),
      ),
    );
  }
}
