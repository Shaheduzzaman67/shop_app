
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopapp/model/DrinkListModel.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<DrinkListModel>(
      builder: (context, _, model){
        return Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(6.0),
            crossAxisCount: 2,
            children: model.drinkType.map((drinkType){
              return DrinkCards(
                drinkType: drinkType,
              );
            }).toList() ,
          ),
        );
      },
    );

  }
}
