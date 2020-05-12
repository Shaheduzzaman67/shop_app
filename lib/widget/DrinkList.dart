
import 'package:flutter/material.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(6.0),
          crossAxisCount: 2,
        children: cofeeType.map((drinkType){
          return DrinkCards(
            drinkType: drinkType,
          );
        }).toList() ,
      ),
    );
  }
}
